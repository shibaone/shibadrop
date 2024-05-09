// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "ERC721A-Upgradeable/extensions/ERC721AQueryableUpgradeable.sol";
import "@openzeppelin-contracts-upgradeable/contracts/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin-contracts-upgradeable/contracts/security/ReentrancyGuardUpgradeable.sol";
import "./StringUtils.sol";
import "./IPrice.sol";

contract SNS is
    AccessControlUpgradeable,
    ReentrancyGuardUpgradeable,
    ERC721AQueryableUpgradeable
{
    using SafeMath for uint256;
    using StringUtils for string;

    enum SpecialName {
        BLACKLIST,
        PREMIUM,
        RESERVED,
        GIVEAWAY
    }

    struct Name {
        address owner;
        uint256 tokenId;
        uint256 noYears;
        uint256 purchaseDate;
    }

    struct GlobalDiscount {
        bool isActive;
        uint16 discountPercentage;
    }

    struct YearsDiscount {
        bool isActive;
        uint256 _years;
        uint16 discountPercentage;
    }

    struct PremiumName {
        uint256 firstYearPrice;
        uint256 nextYearsPrice;
        string category;
    }

    struct GiveawayName {
        address user;
        bool isBlocked;
    }

    mapping(string => Name) public names;
    mapping(uint256 => string) private tokenIdNames;
    mapping(string => PremiumName) private premiumNames;
    mapping(string => bool) private reservedNames;
    mapping(string => GiveawayName) private giveawayNames;
    mapping(string => bool) private blacklisted;
    mapping(uint256 => string) private _tokenURIs;

    string public baseURI;
    IPrice public price;
    GlobalDiscount public globalDiscount;
    YearsDiscount public yearsDiscount;

    bytes32 public constant SPECIAL_WALLET_ROLE =
        keccak256("SPECIAL_WALLET_ROLE");
    bytes32 public constant PREMIUM_NAMES_ROLE =
        keccak256("PREMIUM_NAMES_ROLE");
    bytes32 public constant GLOBAL_DISCOUNT_ROLE =
        keccak256("GLOBAL_DISCOUNT_ROLE");
    bytes32 public constant YEARS_DISCOUNT_ROLE =
        keccak256("YEARS_DISCOUNT_ROLE");
    bytes32 public constant RESERVED_NAMES_ROLE =
        keccak256("YEARS_DISCOUNT_ROLE");
    bytes32 public constant RESERVED_NAMES_WALLET_ROLE =
        keccak256("YEARS_DISCOUNT_ROLE");
    bytes32 public constant GIVEAWAY_NAMES_ROLE = keccak256("GIVEAWAY_ROLE");
    bytes32 public constant BLACKLIST_NAMES_ROLE =
        keccak256("BLACKLIST_NAMES_ROLE");
    bytes32 public constant TOKEN_URI = keccak256("TOKEN_URI");

    bool public isBlocked;
    bytes32 public constant D3_MINTER = keccak256("D3_MINTER");

    event NamesRegistered(
        string[] name,
        uint256 indexed registerDate,
        uint256[] _years,
        address indexed user
    );
    event NameRegistered(
        string name,
        uint256 indexed registerDate,
        uint256 _years,
        address indexed user
    );
    event PremiumNameRegistered(
        string name,
        uint256 indexed registerDate,
        uint256 firstYearPrice,
        uint256 nextYearsPrice,
        string indexed category
    );
    event ReservedNameRegistered(string name, uint256 indexed registerDate);
    event GiveawayNameRegistered(string name, uint256 indexed registerDate);
    event GiveawayNameAssigned(string name, address indexed user);
    event BlacklistedNameRegistered(string name, uint256 indexed registerDate);
    event MetadataUpdate(uint256 _tokenId);

    constructor(
        string memory baseURI_,
        address _price,
        address _tokenUriAddr
    ) initializerERC721A initializer {
        __ERC721A_init("Shib Name Service", "SNS");
        __ReentrancyGuard_init();
        __AccessControl_init();
        baseURI = baseURI_;
        price = IPrice(_price);
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(TOKEN_URI, _tokenUriAddr);
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI)
        external
        virtual
        onlyRole(TOKEN_URI)
    {
        _tokenURIs[tokenId] = _tokenURI;
        emit MetadataUpdate(tokenId);
    }

    function setGlobalDiscount(bool val, uint16 percentage)
        external
        onlyRole(GLOBAL_DISCOUNT_ROLE)
    {
        globalDiscount = GlobalDiscount(val, percentage);
    }

    function setYearsDiscount(
        bool val,
        uint256 _years,
        uint16 percentage
    ) external onlyRole(YEARS_DISCOUNT_ROLE) {
        yearsDiscount = YearsDiscount(val, _years, percentage);
    }

    function setBaseURI(string memory newBaseURI)
        external
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        baseURI = newBaseURI;
    }

    function setPrice(address _price) external onlyRole(DEFAULT_ADMIN_ROLE) {
        price = IPrice(_price);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function setIsBlocked(bool val) external onlyRole(DEFAULT_ADMIN_ROLE) {
        isBlocked = val;
    }

    function deleteSpecialName(string memory _name, SpecialName _type)
        external
    {
        _name = _name.toLowerCase();
        require(names[_name].owner == address(0), "Name already bought");
        if (_type == SpecialName.BLACKLIST) {
            require(
                hasRole(BLACKLIST_NAMES_ROLE, msg.sender),
                "You don't have permissions"
            );
            require(blacklisted[_name], "Invalid blacklisted name");
            delete blacklisted[_name];
        } else if (_type == SpecialName.PREMIUM) {
            require(
                hasRole(PREMIUM_NAMES_ROLE, msg.sender),
                "You don't have permissions"
            );
            require(
                premiumNames[_name].firstYearPrice > 0,
                "Invalid premium name"
            );
            delete premiumNames[_name];
        } else if (_type == SpecialName.RESERVED) {
            require(
                hasRole(RESERVED_NAMES_ROLE, msg.sender),
                "You don't have permissions"
            );
            require(reservedNames[_name], "Invalid reserved name");
            delete reservedNames[_name];
        } else if (_type == SpecialName.GIVEAWAY) {
            require(
                hasRole(GIVEAWAY_NAMES_ROLE, msg.sender),
                "You don't have permissions"
            );
            require(
                giveawayNames[_name].user != address(0) ||
                    !giveawayNames[_name].isBlocked,
                "Invalid giveaway name"
            );
            delete giveawayNames[_name];
        }
    }

    function blockGiveawayName(string memory _name)
        public
        onlyRole(GIVEAWAY_NAMES_ROLE)
    {
        _name = _name.toLowerCase();
        require(names[_name].owner == address(0), "Name already bought");
        require(!reservedNames[_name], "This is a reserved name");
        require(
            premiumNames[_name].firstYearPrice == 0,
            "This is a premium name"
        );
        require(!blacklisted[_name], "This is a blacklisted name");
        giveawayNames[_name].isBlocked = true;
        emit GiveawayNameRegistered(_name, block.timestamp);
    }

    function setUserForGiveawayName(string memory _name, address user)
        public
        onlyRole(GIVEAWAY_NAMES_ROLE)
    {
        _name = _name.toLowerCase();
        require(names[_name].owner == address(0), "Name already bought");
        require(!reservedNames[_name], "This is a reserved name");
        require(
            premiumNames[_name].firstYearPrice == 0,
            "This is a premium name"
        );
        require(!blacklisted[_name], "This is a blacklisted name");
        require(giveawayNames[_name].isBlocked, "This isn't a giveaway name");
        giveawayNames[_name].user = user;
        giveawayNames[_name].isBlocked = false;
        emit GiveawayNameAssigned(_name, user);
    }

    function setBlacklistName(string memory _name)
        public
        onlyRole(BLACKLIST_NAMES_ROLE)
    {
        _name = _name.toLowerCase();
        require(names[_name].owner == address(0), "Name already bought");
        require(!reservedNames[_name], "This is a reserved name");
        require(
            premiumNames[_name].firstYearPrice == 0,
            "This is a premium name"
        );
        require(
            giveawayNames[_name].user == address(0) ||
                !giveawayNames[_name].isBlocked,
            "This is a giveaway name"
        );
        blacklisted[_name] = true;
        emit BlacklistedNameRegistered(_name, block.timestamp);
    }

    function setPremiumName(
        string memory _name,
        uint256 firstYearPrice,
        uint256 nextYearsPrice,
        string memory category
    ) public onlyRole(PREMIUM_NAMES_ROLE) {
        _name = _name.toLowerCase();
        require(names[_name].owner == address(0), "Name already bought");
        require(
            giveawayNames[_name].user == address(0) ||
                !giveawayNames[_name].isBlocked,
            "This is a giveaway name"
        );
        require(!reservedNames[_name], "This is a reserved name");
        require(!blacklisted[_name], "This is a blacklisted name");
        premiumNames[_name] = PremiumName(
            firstYearPrice,
            nextYearsPrice,
            category
        );
        emit PremiumNameRegistered(
            _name,
            block.timestamp,
            firstYearPrice,
            nextYearsPrice,
            category
        );
    }

    function setReservedName(string memory _name)
        public
        onlyRole(RESERVED_NAMES_ROLE)
    {
        _name = _name.toLowerCase();
        require(names[_name].owner == address(0), "Name already bought");
        require(
            premiumNames[_name].firstYearPrice == 0,
            "This is a premium name"
        );
        require(
            giveawayNames[_name].user == address(0) ||
                !giveawayNames[_name].isBlocked,
            "This is a giveaway name"
        );
        require(!blacklisted[_name], "This is a blacklisted name");
        reservedNames[_name] = true;
        emit ReservedNameRegistered(_name, block.timestamp);
    }

    function setMultiReservedName(string[] memory _names)
        external
        onlyRole(RESERVED_NAMES_ROLE)
    {
        for (uint256 i = 0; i < _names.length; i++) {
            setReservedName(_names[i]);
        }
    }

    function setMultiBlacklistName(string[] memory _names)
        external
        onlyRole(BLACKLIST_NAMES_ROLE)
    {
        for (uint256 i = 0; i < _names.length; i++) {
            setBlacklistName(_names[i]);
        }
    }

    function setMultiGiveawayName(
        string[] memory _names,
        address[] memory users
    ) external onlyRole(GIVEAWAY_NAMES_ROLE) {
        require(_names.length == users.length, "Mismatched arrays length");
        for (uint256 i = 0; i < _names.length; i++) {
            setUserForGiveawayName(_names[i], users[i]);
        }
    }

    function blockMultiGiveawayName(string[] memory _names)
        external
        onlyRole(GIVEAWAY_NAMES_ROLE)
    {
        for (uint256 i = 0; i < _names.length; i++) {
            blockGiveawayName(_names[i]);
        }
    }

    function getPremiumName(string memory _name)
        public
        view
        returns (
            uint256 firstYearPrice,
            uint256 nextYearsPrice,
            string memory category
        )
    {
        PremiumName memory premiumName = premiumNames[_name.toLowerCase()];
        return (
            premiumName.firstYearPrice,
            premiumName.nextYearsPrice,
            premiumName.category
        );
    }

    function setMultiPremiumName(
        string[] memory _names,
        uint256[] memory firstYearPrices,
        uint256[] memory nextYearsPrices,
        string[] memory categories
    ) external onlyRole(PREMIUM_NAMES_ROLE) {
        require(
            _names.length == firstYearPrices.length &&
                firstYearPrices.length == nextYearsPrices.length &&
                nextYearsPrices.length == categories.length,
            "Mismatched arrays length"
        );
        for (uint256 i = 0; i < _names.length; i++) {
            setPremiumName(
                _names[i],
                firstYearPrices[i],
                nextYearsPrices[i],
                categories[i]
            );
        }
    }

    function isValid(string memory _name)
        public
        view
        returns (bool result, string memory errMsg)
    {
        _name = _name.toLowerCase();
        if (_name.containsInvalidCharacters()) {
            errMsg = string.concat(_name, " contains invalid characters");
        } else if (names[_name].owner != address(0)) {
            errMsg = string.concat(_name, " is not avaliable");
        } else if (
            bytes(_name).length == 1 &&
            !hasRole(SPECIAL_WALLET_ROLE, msg.sender)
        ) {
            errMsg = string.concat(
                _name,
                " is reserved for the special wallet"
            );
        } else if (
            reservedNames[_name.toLowerCase()] &&
            !hasRole(RESERVED_NAMES_WALLET_ROLE, msg.sender)
        ) {
            errMsg = string.concat(_name, " is reserved");
        } else if (
            (giveawayNames[_name].user != msg.sender &&
                giveawayNames[_name].user != address(0)) ||
            giveawayNames[_name].isBlocked
        ) {
            errMsg = string.concat(_name, " is reserved for the giveaway");
        } else if (blacklisted[_name]) {
            errMsg = string.concat(_name, " is blacklisted");
        }
        result = bytes(errMsg).length == 0;
    }

    function registerName(string memory _name, uint256 _years)
        external
        payable
        nonReentrant
    {
        require(!isBlocked, "The mint is disabled");
        (bool _isValid, string memory errMsg) = isValid(_name);
        require(_isValid, errMsg);
        _name = _name.toLowerCase();
        require(
            msg.value >= calculatePrice(_name, _years),
            "Insufficient BONE sent"
        );
        uint256 tokenId = _nextTokenId();
        _mint(msg.sender, 1);
        emit NameRegistered(_name, block.timestamp, _years, msg.sender);
        names[_name] = Name(msg.sender, tokenId, _years, block.timestamp);
        tokenIdNames[tokenId] = _name;
    }

    function bulkRegisterName(string[] memory _names, uint256[] memory _years)
        external
        payable
        nonReentrant
    {
        require(!isBlocked, "The mint is disabled");
        require(_names.length == _years.length, "Mismatched arrays length");
        uint256 totalCost = 0;
        uint256 tokenId = _nextTokenId();
        for (uint256 i = 0; i < _names.length; i++) {
            (bool _isValid, string memory errMsg) = isValid(_names[i]);
            require(_isValid, errMsg);
            _names[i] = _names[i].toLowerCase();
            totalCost += calculatePrice(_names[i], _years[i]);
            names[_names[i]] = Name(
                msg.sender,
                tokenId,
                _years[i],
                block.timestamp
            );
            tokenIdNames[tokenId] = _names[i];
            tokenId++;
        }
        require(msg.value >= totalCost, "Insufficient BONE sent");
        _mint(msg.sender, _names.length);
        emit NamesRegistered(_names, block.timestamp, _years, msg.sender);
    }

    function privateBulkRegisterName(
        string[] memory _names,
        uint256[] memory _years
    ) external onlyRole(D3_MINTER) {
        require(isBlocked, "The mint is not disabled");
        require(_names.length == _years.length, "Mismatched arrays length");
        uint256 tokenId = _nextTokenId();
        for (uint256 i = 0; i < _names.length; i++) {
            _names[i] = _names[i].toLowerCase();
            require(
                !_names[i].containsInvalidCharacters(),
                string.concat(_names[i], " contains invalid characters")
            );
            require(
                names[_names[i]].owner == address(0),
                string.concat(_names[i], " is not avaliable")
            );
            require(
                !blacklisted[_names[i]],
                string.concat(_names[i], " is blacklisted")
            );
            names[_names[i]] = Name(
                msg.sender,
                tokenId,
                _years[i],
                block.timestamp
            );
            tokenIdNames[tokenId] = _names[i];
            tokenId++;
        }
        _mint(msg.sender, _names.length);
        emit NamesRegistered(_names, block.timestamp, _years, msg.sender);
    }

    function calculatePrice(string memory _name, uint256 _years)
        public
        view
        returns (uint256 _price)
    {
        require(_years >= 1, "Minimum registration period is 1 year");

        if (bytes(_name).length == 1) {
            require(
                hasRole(SPECIAL_WALLET_ROLE, msg.sender),
                "1 character names are reserved for the special wallet"
            );
            return 0;
        }
        _name = _name.toLowerCase();
        if (reservedNames[_name]) {
            require(
                hasRole(RESERVED_NAMES_WALLET_ROLE, msg.sender),
                "This name is reserved"
            );
            return 0;
        }

        require(
            !giveawayNames[_name].isBlocked,
            "This name is blocked for the giveaway"
        );
        if (giveawayNames[_name].user != address(0)) {
            require(
                giveawayNames[_name].user == msg.sender,
                "This name is reserved for the giveaway"
            );
            return 0;
        }

        uint256 pricePerYear;
        if (premiumNames[_name].firstYearPrice != 0) {
            pricePerYear = premiumNames[_name].firstYearPrice;

            if (_years > 1) {
                (bool success, uint256 nextYearPrice) = premiumNames[_name]
                    .nextYearsPrice
                    .tryMul(_years - 1);
                require(success, "Multiplication overflow");

                _price = pricePerYear + nextYearPrice;
            } else _price = pricePerYear;
        } else {
            pricePerYear = price.getPricePerYear(_name);

            (bool success, uint256 total) = pricePerYear.tryMul(_years);
            require(success, "Multiplication overflow");

            _price = total;
        }

        if (yearsDiscount.isActive && _years >= yearsDiscount._years) {
            (bool success, uint256 mul) = _price.tryMul(
                yearsDiscount.discountPercentage
            );
            require(success, "Multiplication overflow");

            (bool success_, uint256 div) = mul.tryDiv(100);
            require(success_, "Multiplication overflow");

            _price -= div;
        }

        if (globalDiscount.isActive) {
            (bool success, uint256 mul) = _price.tryMul(
                globalDiscount.discountPercentage
            );
            require(success, "Multiplication overflow");

            (bool success_, uint256 div) = mul.tryDiv(100);
            require(success_, "Multiplication overflow");

            _price -= div;
        }
    }

    function nameOf(uint256 tokenId) public view returns (string memory) {
        return tokenIdNames[tokenId];
    }

    function tokenOf(string memory _name) public view returns (uint256) {
        _name = _name.toLowerCase();
        require(names[_name].owner != address(0), "No token for this name");
        return names[_name].tokenId;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override(ERC721AUpgradeable, IERC721AUpgradeable)
        returns (string memory)
    {
        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();

        // If there is no base URI, return the token URI.
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        // If both are set, concatenate the baseURI and tokenURI (via string.concat).
        if (bytes(_tokenURI).length > 0) {
            return string.concat(base, _tokenURI);
        }

        return super.tokenURI(tokenId);
    }

    function withdraw() public onlyRole(DEFAULT_ADMIN_ROLE) {
        uint256 amount = address(this).balance;

        (bool success, ) = msg.sender.call{ value: amount }("");
        require(success, "Failed to withdraw");
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(
            IERC721AUpgradeable,
            ERC721AUpgradeable,
            AccessControlUpgradeable
        )
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function _beforeTokenTransfers(
        address from,
        address to,
        uint256 startTokenId,
        uint256 quantity
    ) internal virtual override {}
}
