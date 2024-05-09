// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface IPrice {
    function getPricePerYear(string memory name)
        external
        view
        returns (uint256);
}
