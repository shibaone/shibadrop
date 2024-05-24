// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { ERC721A } from "ERC721A/ERC721A.sol";

/**
 * @title  ERC721AConduitPreapproved
 * @notice ERC721A with the ShibaSea conduit preapproved.
 */
abstract contract ERC721AConduitPreapproved is ERC721A {
    /// @dev The canonical ShibaSea conduit.
    address internal constant _CONDUIT =
        0x9BCb5d51439d218d227D1979d327f7DcD71943F8;

    /**
     * @notice Deploy the token contract.
     *
     * @param name              The name of the token.
     * @param symbol            The symbol of the token.
     */
    constructor(
        string memory name,
        string memory symbol
    ) ERC721A(name, symbol) {}

    /**
     * @dev Returns if the `operator` is allowed to manage all of the
     *      assets of `owner`. Always returns true for the conduit.
     */
    function isApprovedForAll(
        address owner,
        address operator
    ) public view virtual override returns (bool) {
        if (operator == _CONDUIT) {
            return true;
        }
        return ERC721A.isApprovedForAll(owner, operator);
    }
}