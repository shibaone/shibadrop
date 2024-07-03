// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import { ERC721ACloneable } from "./ERC721ACloneable.sol";

/**
 * @title  ERC721AConduitPreapprovedCloneable
 * @notice ERC721A with the ShibaSea conduit preapproved.
 */
abstract contract ERC721AConduitPreapprovedCloneable is ERC721ACloneable {
    /// @dev The canonical ShibaSea conduit.
    address internal constant _CONDUIT =
        0xf981c35f969A16831D2C55FEbcAac75c1B45dec3;

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
