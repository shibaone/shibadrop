// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { Test } from "forge-std/Test.sol";
import {
    ERC721ShibaDropCloneFactory
} from "../../src/clones/ERC721ShibaDropCloneFactory.sol";
import {
    ERC721ShibaDropCloneable
} from "../../src/clones/ERC721ShibaDropCloneable.sol";
import { ShibaDrop } from "../../src/ShibaDrop.sol";
import { PublicDrop } from "../../src/lib/ShibaDropStructs.sol";

contract ERC721ShibaDropCloneFactoryTest is Test {
    ERC721ShibaDropCloneFactory factory;

    function setUp() public {
        factory = new ERC721ShibaDropCloneFactory();
    }

    function testClone__snapshot() public {
        factory.createClone("name", "symbol", bytes32("1"));
    }

    event ShibaDropTokenDeployed();

    function testClone1() public {
        vm.createSelectFork(getChain("mainnet").rpcUrl);
        factory = new ERC721ShibaDropCloneFactory();
        vm.expectEmit(false, false, false, false);
        emit ShibaDropTokenDeployed();
        address clone = factory.createClone("name", "symbol", bytes32("1"));
        ERC721ShibaDropCloneable token = ERC721ShibaDropCloneable(clone);

        assertEq(token.name(), "name", "name should be set");
        assertEq(token.symbol(), "symbol", "symbol should be set");
        assertEq(token.owner(), address(this), "owner should be set");
        token.updateCreatorPayoutAddress(
            factory.DEFAULT_SHIBADROP(),
            address(1234)
        );
        ShibaDrop seaDrop = ShibaDrop(factory.DEFAULT_SHIBADROP());
        assertEq(
            seaDrop.getCreatorPayoutAddress(address(token)),
            address(1234)
        );

        assertEq(token.totalSupply(), 0);

        token.updatePublicDrop(
            factory.DEFAULT_SHIBADROP(),
            PublicDrop({
                mintPrice: 1 ether,
                startTime: uint48(block.timestamp),
                endTime: uint48(block.timestamp + 1 days),
                maxTotalMintableByWallet: 3,
                feeBps: 0,
                restrictFeeRecipients: false
            })
        );
        token.setMaxSupply(100);

        seaDrop.mintPublic{ value: 1 ether }(
            address(token),
            address(1),
            address(0),
            1
        );
        assertEq(token.totalSupply(), 1);
        assertEq(token.ownerOf(1), address(this));

        assertEq(token.tokenURI(1), "", "tokenURI should be blank at first");
        assertEq(token.baseURI(), "", "baseURI should be blank at first");

        token.setBaseURI("https://example.com");
        assertEq(
            token.tokenURI(1),
            token.baseURI(),
            "tokenURI just the baseURI"
        );

        token.setBaseURI("https://example.com/");
        assertEq(
            token.tokenURI(1),
            string(abi.encodePacked(token.baseURI(), "1")),
            "tokenURI the baseURI + tokenID"
        );
    }

    function testClone_Reinitialize() public {
        address clone = factory.createClone("name", "symbol", bytes32("1"));
        ERC721ShibaDropCloneable token = ERC721ShibaDropCloneable(clone);
        vm.expectRevert("Initializable: contract is already initialized");
        token.initialize("name", "symbol", new address[](0), address(this));
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) public pure returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
