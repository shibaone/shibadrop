// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { ERC721ACloneable } from "./ERC721ACloneable.sol";

/**
 * @title  ERC721AConduitPreapprovedCloneable
 * @notice ERC721A with the ShibaSea conduit preapproved.
 */
abstract contract ERC721AConduitPreapprovedCloneable is ERC721ACloneable {
    /// @dev The canonical ShibaSea conduit.
    address internal constant _CONDUIT =
        0x9BCb5d51439d218d227D1979d327f7DcD71943F8;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the
     *      assets of `owner`. Always returns true for the conduit.
     */
    function isApprovedForAll(address owner, address operator)
        public
        view
        virtual
        override
        returns (bool)
    {
        if (operator == _CONDUIT) {
            return true;
        }
        return ERC721ACloneable.isApprovedForAll(owner, operator);
    }
}
