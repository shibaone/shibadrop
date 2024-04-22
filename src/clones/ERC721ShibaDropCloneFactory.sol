// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { ERC721ShibaDropCloneable } from "./ERC721ShibaDropCloneable.sol";

import { Clones } from "openzeppelin-contracts/proxy/Clones.sol";

contract ERC721ShibaDropCloneFactory {
    address public immutable shibaDropCloneableUpgradeableImplementation;
    address public constant DEFAULT_SHIBADROP =
        0x4a5E9F41d59DbEb6CA907A148203B13a5Ce12a85;

    event NewInstance(address indexed instance);

    constructor() {
        ERC721ShibaDropCloneable impl = new ERC721ShibaDropCloneable();
        impl.initialize("", "", new address[](0), address(this));
        shibaDropCloneableUpgradeableImplementation = address(impl);
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
            shibaDropCloneableUpgradeableImplementation,
            cloneSalt
        );
        address[] memory allowedShibaDrop = new address[](1);
        allowedShibaDrop[0] = DEFAULT_SHIBADROP;
        ERC721ShibaDropCloneable(instance).initialize(
            name,
            symbol,
            allowedShibaDrop,
            msg.sender
        );
        emit NewInstance(instance);
        return instance;
    }
}
