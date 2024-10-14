// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import { ShibaDrop } from "../ShibaDrop.sol";

contract MaliciousRecipient {
    bool public startAttack;
    address public token;
    ShibaDrop public seaDrop;

    receive() external payable {
        if (startAttack) {
            startAttack = false;
            seaDrop.mintPublic{ value: 1 ether }({
                nftContract: token,
                feeRecipient: address(this),
                minterIfNotPayer: address(this),
                quantity: 1
            });
        }
    }

    // Also receive some eth in the process
    function setStartAttack() public payable {
        startAttack = true;
    }

    function attack(ShibaDrop _seaDrop, address _token) external payable {
        token = _token;
        seaDrop = _seaDrop;

        _seaDrop.mintPublic{ value: 1 ether }({
            nftContract: _token,
            feeRecipient: address(this),
            minterIfNotPayer: address(this),
            quantity: 1
        });

        token = address(0);
        seaDrop = ShibaDrop(address(0));
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
