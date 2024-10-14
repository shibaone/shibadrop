// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { ERC721AUpgradeable } from "../../lib/ERC721A-Upgradeable/contracts/ERC721AUpgradeable.sol";

/**
 * @title  ERC721AConduitPreapproved
 * @notice ERC721A with the ShibaSea conduit preapproved.
 */
abstract contract ERC721AConduitPreapprovedUpgradeable is ERC721AUpgradeable {
    /// @dev The canonical ShibaSea conduit.
    address internal constant _CONDUIT = 0xf981c35f969A16831D2C55FEbcAac75c1B45dec3;

    /**
     * @notice Deploy the token contract with its name and symbol.
     */
    function __ERC721AConduitPreapprovedUpgradeable_init_unchained(
        string memory name, string memory symbol
    ) internal onlyInitializing {
        __ERC721A_init_unchained(name, symbol);
    }

    /**
     * @dev Returns if the `operator` is allowed to manage all of the
     *      assets of `owner`. Always returns true for the conduit.
     */
    function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {
        if (operator == _CONDUIT) {
            return true;
        }
        return ERC721A.isApprovedForAll(owner, operator);
    }
}
