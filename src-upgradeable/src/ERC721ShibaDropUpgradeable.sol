// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {
    ERC721ContractMetadataUpgradeable,
    IShibaDropTokenContractMetadataUpgradeable
} from "./ERC721ContractMetadataUpgradeable.sol";

import {
    INonFungibleShibaDropTokenUpgradeable
} from "./interfaces/INonFungibleShibaDropTokenUpgradeable.sol";

import { IShibaDropUpgradeable } from "./interfaces/IShibaDropUpgradeable.sol";

import {
    AllowListData,
    PublicDrop,
    TokenGatedDropStage,
    SignedMintValidationParams
} from "./lib/ShibaDropStructsUpgradeable.sol";

import {
    ERC721ShibaDropStructsErrorsAndEventsUpgradeable
} from "./lib/ERC721ShibaDropStructsErrorsAndEventsUpgradeable.sol";

import {
    ReentrancyGuardUpgradeable
} from "../lib-upgradeable/solmate/src/utils/ReentrancyGuardUpgradeable.sol";

import {
    IERC165Upgradeable
} from "../lib/openzeppelin-contracts-upgradeable/contracts/utils/introspection/IERC165Upgradeable.sol";

import { ERC721ShibaDropStorage } from "./ERC721ShibaDropStorage.sol";

import {
    ERC721ContractMetadataStorage
} from "./ERC721ContractMetadataStorage.sol";

/**
 * @title  ERC721ShibaDropUpgradeable
 * @author James Wenzel (emo.eth)
 * @author Ryan Ghods (ralxz.eth)
 * @author Stephan Min (stephanm.eth)
 * @custom:contributor Limit Break (@limitbreak)
 * @notice ERC721ShibaDrop is a token contract that contains methods
 *         to properly interact with ShibaDrop.
 *         Implements Limit Break's Creator Token Standards transfer
 *         validation for royalty enforcement.
 */
contract ERC721ShibaDropUpgradeable is
    ERC721ContractMetadataUpgradeable,
    INonFungibleShibaDropTokenUpgradeable,
    ERC721ShibaDropStructsErrorsAndEventsUpgradeable,
    ReentrancyGuardUpgradeable
{
    using ERC721ShibaDropStorage for ERC721ShibaDropStorage.Layout;
    using ERC721ContractMetadataStorage for ERC721ContractMetadataStorage.Layout;

    /**
     * @dev Reverts if not an allowed ShibaDrop contract.
     *      This function is inlined instead of being a modifier
     *      to save contract space from being inlined N times.
     *
     * @param seaDrop The ShibaDrop address to check if allowed.
     */
    function _onlyAllowedSeaDrop(address seaDrop) internal view {
        if (ERC721ShibaDropStorage.layout()._allowedSeaDrop[seaDrop] != true) {
            revert OnlyAllowedSeaDrop();
        }
    }

    /**
     * @notice Deploy the token contract with its name, symbol,
     *         and allowed ShibaDrop addresses.
     */
    function __ERC721ShibaDrop_init(
        string memory name,
        string memory symbol,
        address[] memory allowedSeaDrop
    ) internal onlyInitializing {
        __ERC721A_init_unchained(name, symbol);
        __ConstructorInitializable_init_unchained();
        __TwoStepOwnable_init_unchained();
        __ERC721ContractMetadata_init_unchained(name, symbol);
        __ReentrancyGuard_init_unchained();
        __ERC721ShibaDrop_init_unchained(name, symbol, allowedSeaDrop);
    }

    function __ERC721ShibaDrop_init_unchained(
        string memory,
        string memory,
        address[] memory allowedSeaDrop
    ) internal onlyInitializing {
        // Put the length on the stack for more efficient access.
        uint256 allowedSeaDropLength = allowedSeaDrop.length;

        // Set the mapping for allowed ShibaDrop contracts.
        for (uint256 i = 0; i < allowedSeaDropLength; ) {
            ERC721ShibaDropStorage.layout()._allowedSeaDrop[
                allowedSeaDrop[i]
            ] = true;

            unchecked {
                ++i;
            }
        }

        // Set the enumeration.
        ERC721ShibaDropStorage
            .layout()
            ._enumeratedAllowedSeaDrop = allowedSeaDrop;

        // Emit an event noting the contract deployment.
        emit SeaDropTokenDeployed();
    }

    /**
     * @notice Update the allowed ShibaDrop contracts.
     *         Only the owner can use this function.
     *
     * @param allowedSeaDrop The allowed ShibaDrop addresses.
     */
    function updateAllowedSeaDrop(address[] calldata allowedSeaDrop)
        external
        virtual
        override
        onlyOwner
    {
        _updateAllowedSeaDrop(allowedSeaDrop);
    }

    /**
     * @notice Internal function to update the allowed ShibaDrop contracts.
     *
     * @param allowedSeaDrop The allowed ShibaDrop addresses.
     */
    function _updateAllowedSeaDrop(address[] calldata allowedSeaDrop) internal {
        // Put the length on the stack for more efficient access.
        uint256 enumeratedAllowedSeaDropLength = ERC721ShibaDropStorage
            .layout()
            ._enumeratedAllowedSeaDrop
            .length;

        uint256 allowedSeaDropLength = allowedSeaDrop.length;

        // Reset the old mapping.
        for (uint256 i = 0; i < enumeratedAllowedSeaDropLength; ) {
            ERC721ShibaDropStorage.layout()._allowedSeaDrop[
                ERC721ShibaDropStorage.layout()._enumeratedAllowedSeaDrop[i]
            ] = false;

            unchecked {
                ++i;
            }
        }

        // Set the new mapping for allowed ShibaDrop contracts.
        for (uint256 i = 0; i < allowedSeaDropLength; ) {
            ERC721ShibaDropStorage.layout()._allowedSeaDrop[
                allowedSeaDrop[i]
            ] = true;

            unchecked {
                ++i;
            }
        }

        // Set the enumeration.
        ERC721ShibaDropStorage
            .layout()
            ._enumeratedAllowedSeaDrop = allowedSeaDrop;

        // Emit an event for the update.
        emit AllowedSeaDropUpdated(allowedSeaDrop);
    }

    /**
     * @notice Burns `tokenId`. The caller must own `tokenId` or be an
     *         approved operator.
     *
     * @param tokenId The token id to burn.
     */
    // solhint-disable-next-line comprehensive-interface
    function burn(uint256 tokenId) external {
        _burn(tokenId, true);
    }

    /**
     * @dev Overrides the `_startTokenId` function from ERC721A
     *      to start at token id `1`.
     *
     *      This is to avoid future possible problems since `0` is usually
     *      used to signal values that have not been set or have been removed.
     */
    function _startTokenId() internal view virtual override returns (uint256) {
        return 1;
    }

    /**
     * @dev Overrides the `tokenURI()` function from ERC721A
     *      to return just the base URI if it is implied to not be a directory.
     *
     *      This is to help with ERC721 contracts in which the same token URI
     *      is desired for each token, such as when the tokenURI is 'unrevealed'.
     */
    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        if (!_exists(tokenId)) revert URIQueryForNonexistentToken();

        string memory baseURI = _baseURI();

        // Exit early if the baseURI is empty.
        if (bytes(baseURI).length == 0) {
            return "";
        }

        // Check if the last character in baseURI is a slash.
        if (bytes(baseURI)[bytes(baseURI).length - 1] != bytes("/")[0]) {
            return baseURI;
        }

        return string(abi.encodePacked(baseURI, _toString(tokenId)));
    }

    /**
     * @notice Mint tokens, restricted to the ShibaDrop contract.
     *
     * @dev    NOTE: If a token registers itself with multiple ShibaDrop
     *         contracts, the implementation of this function should guard
     *         against reentrancy. If the implementing token uses
     *         _safeMint(), or a feeRecipient with a malicious receive() hook
     *         is specified, the token or fee recipients may be able to execute
     *         another mint in the same transaction via a separate ShibaDrop
     *         contract.
     *         This is dangerous if an implementing token does not correctly
     *         update the minterNumMinted and currentTotalSupply values before
     *         transferring minted tokens, as ShibaDrop references these values
     *         to enforce token limits on a per-wallet and per-stage basis.
     *
     *         ERC721A tracks these values automatically, but this note and
     *         nonReentrant modifier are left here to encourage best-practices
     *         when referencing this contract.
     *
     * @param minter   The address to mint to.
     * @param quantity The number of tokens to mint.
     */
    function mintSeaDrop(address minter, uint256 quantity)
        external
        virtual
        override
        nonReentrant
    {
        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(msg.sender);

        // Extra safety check to ensure the max supply is not exceeded.
        if (_totalMinted() + quantity > maxSupply()) {
            revert MintQuantityExceedsMaxSupply(
                _totalMinted() + quantity,
                maxSupply()
            );
        }

        // Mint the quantity of tokens to the minter.
        _safeMint(minter, quantity);
    }

    /**
     * @notice Update the public drop data for this nft contract on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl The allowed ShibaDrop contract.
     * @param publicDrop  The public drop data.
     */
    function updatePublicDrop(
        address shibaDropImpl,
        PublicDrop calldata publicDrop
    ) external virtual override {
        // Ensure the sender is only the owner or contract itself.
        _onlyOwnerOrSelf();

        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(shibaDropImpl);

        // Update the public drop data on ShibaDrop.
        IShibaDropUpgradeable(shibaDropImpl).updatePublicDrop(publicDrop);
    }

    /**
     * @notice Update the allow list data for this nft contract on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl   The allowed ShibaDrop contract.
     * @param allowListData The allow list data.
     */
    function updateAllowList(
        address shibaDropImpl,
        AllowListData calldata allowListData
    ) external virtual override {
        // Ensure the sender is only the owner or contract itself.
        _onlyOwnerOrSelf();

        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(shibaDropImpl);

        // Update the allow list on ShibaDrop.
        IShibaDropUpgradeable(shibaDropImpl).updateAllowList(allowListData);
    }

    /**
     * @notice Update the token gated drop stage data for this nft contract
     *         on ShibaDrop.
     *         Only the owner can use this function.
     *
     *         Note: If two INonFungibleShibaDropToken tokens are doing
     *         simultaneous token gated drop promotions for each other,
     *         they can be minted by the same actor until
     *         `maxTokenSupplyForStage` is reached. Please ensure the
     *         `allowedNftToken` is not running an active drop during the
     *         `dropStage` time period.
     *
     * @param shibaDropImpl     The allowed ShibaDrop contract.
     * @param allowedNftToken The allowed nft token.
     * @param dropStage       The token gated drop stage data.
     */
    function updateTokenGatedDrop(
        address shibaDropImpl,
        address allowedNftToken,
        TokenGatedDropStage calldata dropStage
    ) external virtual override {
        // Ensure the sender is only the owner or contract itself.
        _onlyOwnerOrSelf();

        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(shibaDropImpl);

        // Update the token gated drop stage.
        IShibaDropUpgradeable(shibaDropImpl).updateTokenGatedDrop(
            allowedNftToken,
            dropStage
        );
    }

    /**
     * @notice Update the drop URI for this nft contract on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl The allowed ShibaDrop contract.
     * @param dropURI     The new drop URI.
     */
    function updateDropURI(address shibaDropImpl, string calldata dropURI)
        external
        virtual
        override
    {
        // Ensure the sender is only the owner or contract itself.
        _onlyOwnerOrSelf();

        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(shibaDropImpl);

        // Update the drop URI.
        IShibaDropUpgradeable(shibaDropImpl).updateDropURI(dropURI);
    }

    /**
     * @notice Update the creator payout address for this nft contract on ShibaDrop.
     *         Only the owner can set the creator payout address.
     *
     * @param shibaDropImpl   The allowed ShibaDrop contract.
     * @param payoutAddress The new payout address.
     */
    function updateCreatorPayoutAddress(
        address shibaDropImpl,
        address payoutAddress
    ) external {
        // Ensure the sender is only the owner or contract itself.
        _onlyOwnerOrSelf();

        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(shibaDropImpl);

        // Update the creator payout address.
        IShibaDropUpgradeable(shibaDropImpl).updateCreatorPayoutAddress(
            payoutAddress
        );
    }

    /**
     * @notice Update the allowed fee recipient for this nft contract
     *         on ShibaDrop.
     *         Only the owner can set the allowed fee recipient.
     *
     * @param shibaDropImpl  The allowed ShibaDrop contract.
     * @param feeRecipient The new fee recipient.
     * @param allowed      If the fee recipient is allowed.
     */
    function updateAllowedFeeRecipient(
        address shibaDropImpl,
        address feeRecipient,
        bool allowed
    ) external virtual {
        // Ensure the sender is only the owner or contract itself.
        _onlyOwnerOrSelf();

        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(shibaDropImpl);

        // Update the allowed fee recipient.
        IShibaDropUpgradeable(shibaDropImpl).updateAllowedFeeRecipient(
            feeRecipient,
            allowed
        );
    }

    /**
     * @notice Update the server-side signers for this nft contract
     *         on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl                The allowed ShibaDrop contract.
     * @param signer                     The signer to update.
     * @param signedMintValidationParams Minimum and maximum parameters to
     *                                   enforce for signed mints.
     */
    function updateSignedMintValidationParams(
        address shibaDropImpl,
        address signer,
        SignedMintValidationParams memory signedMintValidationParams
    ) external virtual override {
        // Ensure the sender is only the owner or contract itself.
        _onlyOwnerOrSelf();

        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(shibaDropImpl);

        // Update the signer.
        IShibaDropUpgradeable(shibaDropImpl).updateSignedMintValidationParams(
            signer,
            signedMintValidationParams
        );
    }

    /**
     * @notice Update the allowed payers for this nft contract on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl The allowed ShibaDrop contract.
     * @param payer       The payer to update.
     * @param allowed     Whether the payer is allowed.
     */
    function updatePayer(
        address shibaDropImpl,
        address payer,
        bool allowed
    ) external virtual override {
        // Ensure the sender is only the owner or contract itself.
        _onlyOwnerOrSelf();

        // Ensure the ShibaDrop is allowed.
        _onlyAllowedSeaDrop(shibaDropImpl);

        // Update the payer.
        IShibaDropUpgradeable(shibaDropImpl).updatePayer(payer, allowed);
    }

    /**
     * @notice Returns a set of mint stats for the address.
     *         This assists ShibaDrop in enforcing maxSupply,
     *         maxTotalMintableByWallet, and maxTokenSupplyForStage checks.
     *
     * @dev    NOTE: Implementing contracts should always update these numbers
     *         before transferring any tokens with _safeMint() to mitigate
     *         consequences of malicious onERC721Received() hooks.
     *
     * @param minter The minter address.
     */
    function getMintStats(address minter)
        external
        view
        override
        returns (
            uint256 minterNumMinted,
            uint256 currentTotalSupply,
            uint256 maxSupply
        )
    {
        minterNumMinted = _numberMinted(minter);
        currentTotalSupply = _totalMinted();
        maxSupply = ERC721ContractMetadataStorage.layout()._maxSupply;
    }

    /**
     * @notice Returns whether the interface is supported.
     *
     * @param interfaceId The interface id to check against.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(IERC165Upgradeable, ERC721ContractMetadataUpgradeable)
        returns (bool)
    {
        return
            interfaceId ==
            type(INonFungibleShibaDropTokenUpgradeable).interfaceId ||
            interfaceId ==
            type(IShibaDropTokenContractMetadataUpgradeable).interfaceId ||
            // ERC721ContractMetadata returns supportsInterface true for
            //     EIP-2981
            // ERC721A returns supportsInterface true for
            //     ERC165, ERC721, ERC721Metadata
            super.supportsInterface(interfaceId);
    }

    /**
     * @notice Configure multiple properties at a time.
     *
     *         Note: The individual configure methods should be used
     *         to unset or reset any properties to zero, as this method
     *         will ignore zero-value properties in the config struct.
     *
     * @param config The configuration struct.
     */
    function multiConfigure(MultiConfigureStruct calldata config)
        external
        onlyOwner
    {
        if (config.maxSupply > 0) {
            this.setMaxSupply(config.maxSupply);
        }
        if (bytes(config.baseURI).length != 0) {
            this.setBaseURI(config.baseURI);
        }
        if (bytes(config.contractURI).length != 0) {
            this.setContractURI(config.contractURI);
        }
        if (
            _cast(config.publicDrop.startTime != 0) |
                _cast(config.publicDrop.endTime != 0) ==
            1
        ) {
            this.updatePublicDrop(config.shibaDropImpl, config.publicDrop);
        }
        if (bytes(config.dropURI).length != 0) {
            this.updateDropURI(config.shibaDropImpl, config.dropURI);
        }
        if (config.allowListData.merkleRoot != bytes32(0)) {
            this.updateAllowList(config.shibaDropImpl, config.allowListData);
        }
        if (config.creatorPayoutAddress != address(0)) {
            this.updateCreatorPayoutAddress(
                config.shibaDropImpl,
                config.creatorPayoutAddress
            );
        }
        if (config.provenanceHash != bytes32(0)) {
            this.setProvenanceHash(config.provenanceHash);
        }
        if (config.allowedFeeRecipients.length > 0) {
            for (uint256 i = 0; i < config.allowedFeeRecipients.length; ) {
                this.updateAllowedFeeRecipient(
                    config.shibaDropImpl,
                    config.allowedFeeRecipients[i],
                    true
                );
                unchecked {
                    ++i;
                }
            }
        }
        if (config.disallowedFeeRecipients.length > 0) {
            for (uint256 i = 0; i < config.disallowedFeeRecipients.length; ) {
                this.updateAllowedFeeRecipient(
                    config.shibaDropImpl,
                    config.disallowedFeeRecipients[i],
                    false
                );
                unchecked {
                    ++i;
                }
            }
        }
        if (config.allowedPayers.length > 0) {
            for (uint256 i = 0; i < config.allowedPayers.length; ) {
                this.updatePayer(
                    config.shibaDropImpl,
                    config.allowedPayers[i],
                    true
                );
                unchecked {
                    ++i;
                }
            }
        }
        if (config.disallowedPayers.length > 0) {
            for (uint256 i = 0; i < config.disallowedPayers.length; ) {
                this.updatePayer(
                    config.shibaDropImpl,
                    config.disallowedPayers[i],
                    false
                );
                unchecked {
                    ++i;
                }
            }
        }
        if (config.tokenGatedDropStages.length > 0) {
            if (
                config.tokenGatedDropStages.length !=
                config.tokenGatedAllowedNftTokens.length
            ) {
                revert TokenGatedMismatch();
            }
            for (uint256 i = 0; i < config.tokenGatedDropStages.length; ) {
                this.updateTokenGatedDrop(
                    config.shibaDropImpl,
                    config.tokenGatedAllowedNftTokens[i],
                    config.tokenGatedDropStages[i]
                );
                unchecked {
                    ++i;
                }
            }
        }
        if (config.disallowedTokenGatedAllowedNftTokens.length > 0) {
            for (
                uint256 i = 0;
                i < config.disallowedTokenGatedAllowedNftTokens.length;

            ) {
                TokenGatedDropStage memory emptyStage;
                this.updateTokenGatedDrop(
                    config.shibaDropImpl,
                    config.disallowedTokenGatedAllowedNftTokens[i],
                    emptyStage
                );
                unchecked {
                    ++i;
                }
            }
        }
        if (config.signedMintValidationParams.length > 0) {
            if (
                config.signedMintValidationParams.length !=
                config.signers.length
            ) {
                revert SignersMismatch();
            }
            for (
                uint256 i = 0;
                i < config.signedMintValidationParams.length;

            ) {
                this.updateSignedMintValidationParams(
                    config.shibaDropImpl,
                    config.signers[i],
                    config.signedMintValidationParams[i]
                );
                unchecked {
                    ++i;
                }
            }
        }
        if (config.disallowedSigners.length > 0) {
            for (uint256 i = 0; i < config.disallowedSigners.length; ) {
                SignedMintValidationParams memory emptyParams;
                this.updateSignedMintValidationParams(
                    config.shibaDropImpl,
                    config.disallowedSigners[i],
                    emptyParams
                );
                unchecked {
                    ++i;
                }
            }
        }
    }
}
