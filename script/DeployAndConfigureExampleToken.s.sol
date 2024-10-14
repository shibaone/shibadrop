// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Script.sol";

import { ERC721ShibaDrop } from "../src/ERC721ShibaDrop.sol";

import { IShibaDrop } from "../src/interfaces/IShibaDrop.sol";

import { PublicDrop } from "../src/lib/ShibaDropStructs.sol";

contract DeployAndConfigureExampleToken is Script {
    // Addresses
    address shibadrop = 0x00005EA00Ac477B1030CE78506496e8C2dE24bf5;
    address creator = 0x26faf8AE18d15Ed1CA0563727Ad6D4Aa02fb2F80;
    address feeRecipient = 0x0000a26b00c1F0DF003000390027140000fAa719;

    // Token config
    uint256 maxSupply = 100;

    // Drop config
    uint16 feeBps = 500; // 5%
    uint80 mintPrice = 0.0001 ether;
    uint16 maxTotalMintableByWallet = 5;

    function run() external {
        vm.startBroadcast();

        address[] memory allowedShibadrop = new address[](1);
        allowedShibadrop[0] = shibadrop;

        ERC721ShibaDrop token = new ERC721ShibaDrop(
            "My Example Token",
            "ExTKN",
            allowedShibadrop
        );

        // Configure the token.
        token.setMaxSupply(maxSupply);

        // Configure the drop parameters.
        token.updateCreatorPayoutAddress(shibadrop, creator);
        token.updateAllowedFeeRecipient(shibadrop, feeRecipient, true);
        token.updatePublicDrop(
            shibadrop,
            PublicDrop(
                mintPrice,
                uint48(block.timestamp), // start time
                uint48(block.timestamp) + 1000, // end time
                maxTotalMintableByWallet,
                feeBps,
                true
            )
        );

        // We are ready, let's mint the first 3 tokens!
        IShibaDrop(shibadrop).mintPublic{ value: mintPrice * 3 }(
            address(token),
            feeRecipient,
            address(0),
            3 // quantity
        );
    }
}
