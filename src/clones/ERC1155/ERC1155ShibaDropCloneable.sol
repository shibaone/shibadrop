// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {
    ERC1155ShibaDropContractOffererCloneable
} from "./ERC1155ShibaDropContractOffererCloneable.sol";

/**
 * @title  ERC1155ShibaDropCloneable
 * @author James Wenzel (emo.eth)
 * @author Ryan Ghods (ralxz.eth)
 * @author Stephan Min (stephanm.eth)
 * @author Michael Cohen (notmichael.eth)
 * @custom:contributor Limit Break (@limitbreak)
 * @notice A cloneable ERC1155 token contract that can mint as a
 *         Shibaport contract offerer.
 *         Implements Limit Break's Creator Token Standards transfer
 *         validation for royalty enforcement.
 */
contract ERC1155ShibaDropCloneable is ERC1155ShibaDropContractOffererCloneable {
    /**
     * @notice Initialize the token contract.
     *
     * @param allowedConfigurer The address of the contract allowed to
     *                          implementation code. Also contains SeaDrop
     *                          implementation code.
     * @param allowedShibaport    The address of the Shibaport contract allowed to
     *                          interact.
     * @param name_             The name of the token.
     * @param symbol_           The symbol of the token.
     */
    function initialize(
        address allowedConfigurer,
        address allowedShibaport,
        string memory name_,
        string memory symbol_,
        address initialOwner
    ) public initializer {
        // Initialize ownership.
        _initializeOwner(initialOwner);

        // Initialize ERC1155ShibaDropContractOffererCloneable.
        __ERC1155SeaDropContractOffererCloneable_init(
            allowedConfigurer,
            allowedShibaport,
            name_,
            symbol_
        );
    }

    /**
     * @notice Burns a token, restricted to the owner or approved operator,
     *         and must have sufficient balance.
     *
     * @param from   The address to burn from.
     * @param id     The token id to burn.
     * @param amount The amount to burn.
     */
    function burn(
        address from,
        uint256 id,
        uint256 amount
    ) external {
        // Burn the token.
        _burn(msg.sender, from, id, amount);
    }

    /**
     * @notice Burns a batch of tokens, restricted to the owner or
     *         approved operator, and must have sufficient balance.
     *
     * @param from    The address to burn from.
     * @param ids     The token ids to burn.
     * @param amounts The amounts to burn per token id.
     */
    function batchBurn(
        address from,
        uint256[] calldata ids,
        uint256[] calldata amounts
    ) external {
        // Burn the tokens.
        _batchBurn(msg.sender, from, ids, amounts);
    }

    function contractURI() external view override returns (string memory) {
        return _baseURI;
    }
}
