// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { ERC1155ShibaDropCloneable } from "./ERC1155ShibaDropCloneable.sol";

import {
    ERC1155ShibaDropConfigurer
} from "../../lib/ERC1155/ERC1155ShibaDropConfigurer.sol";

import { Clones } from "@openzeppelin/contracts/proxy/Clones.sol";

/**
 * @title  ERC1155ShibaDropCloneFactory
 * @author James Wenzel (emo.eth)
 * @author Ryan Ghods (ralxz.eth)
 * @author Stephan Min (stephanm.eth)
 * @author Michael Cohen (notmichael.eth)
 * @notice A factory contract that deploys ERC1155 token contracts
 *         that can mint as Seaport contract offerers.
 */
contract ERC1155ShibaDropCloneFactory {
    address public immutable shibaport;
    address public immutable configurer;
    address public immutable cloneableImplementation;

    constructor(address allowedShibaport) {
        shibaport = allowedShibaport;

        ERC1155ShibaDropConfigurer config = new ERC1155ShibaDropConfigurer();
        configurer = address(config);

        ERC1155ShibaDropCloneable impl = new ERC1155ShibaDropCloneable();
        impl.initialize(configurer, shibaport, "", "", address(this));
        cloneableImplementation = address(impl);
    }

    function createClone(
        string memory name,
        string memory symbol,
        bytes32 salt
    ) external returns (address instance) {
        // Derive a pseudo-random salt, so clone addresses don't collide
        // across chains.
        bytes32 cloneSalt = keccak256(
            abi.encodePacked(salt, blockhash(block.number))
        );

        instance = Clones.cloneDeterministic(
            cloneableImplementation,
            cloneSalt
        );
        ERC1155ShibaDropCloneable(instance).initialize(
            configurer,
            shibaport,
            name,
            symbol,
            msg.sender
        );
    }
}
