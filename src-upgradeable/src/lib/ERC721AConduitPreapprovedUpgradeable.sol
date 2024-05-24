// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { ERC721AUpgradeable } from "../../lib/ERC721A-Upgradeable/contracts/ERC721AUpgradeable.sol";

/**
 * @title  ERC721AConduitPreapproved
 * @notice ERC721A with the ShibaSea conduit preapproved.
 */
abstract contract ERC721AConduitPreapprovedUpgradeable is ERC721AUpgradeable {
    /// @dev The canonical ShibaSea conduit.
    address internal constant _CONDUIT = 0x9BCb5d51439d218d227D1979d327f7DcD71943F8;

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
