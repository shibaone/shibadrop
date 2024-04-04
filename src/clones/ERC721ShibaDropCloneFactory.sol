// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { ERC721ShibaDropCloneable } from "./ERC721ShibaDropCloneable.sol";

import { Clones } from "openzeppelin-contracts/proxy/Clones.sol";

contract ERC721ShibaDropCloneFactory {
    address public immutable seaDropCloneableUpgradeableImplementation;
    address public constant DEFAULT_SEADROP =
        0x00005EA00Ac477B1030CE78506496e8C2dE24bf5;

    constructor() {
        ERC721ShibaDropCloneable impl = new ERC721ShibaDropCloneable();
        impl.initialize("", "", new address[](0), address(this));
        seaDropCloneableUpgradeableImplementation = address(impl);
    }

    function createClone(
        string memory name,
        string memory symbol,
        bytes32 salt
    ) external returns (address) {
        // Derive a pseudo-random salt, so clone addresses don't collide
        // across chains.
        bytes32 cloneSalt = keccak256(
            abi.encodePacked(salt, blockhash(block.number))
        );

        address instance = Clones.cloneDeterministic(
            seaDropCloneableUpgradeableImplementation,
            cloneSalt
        );
        address[] memory allowedSeaDrop = new address[](1);
        allowedSeaDrop[0] = DEFAULT_SEADROP;
        ERC721ShibaDropCloneable(instance).initialize(
            name,
            symbol,
            allowedSeaDrop,
            msg.sender
        );
        return instance;
    }
}
