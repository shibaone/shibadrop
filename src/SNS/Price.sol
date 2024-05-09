// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./IPrice.sol";

contract Price is IPrice {
    struct Tier {
        uint256 len_from;
        uint256 len_to;
        uint256 pricePerYear;
    }

    uint256 public MAX_LENGTH;
    Tier[] public tiers;

    address public owner;

    constructor() {
        MAX_LENGTH = type(uint256).max;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Non owner");
        _;
    }

    function addTier(
        uint256 len_from,
        uint256 len_to,
        uint256 pricePerYear
    ) public onlyOwner returns (uint256) {
        if (len_to == 0) {
            len_to = MAX_LENGTH;
        }
        require(len_from <= len_to, "Invalid range");
        Tier memory newTier = Tier(len_from, len_to, pricePerYear);
        require(
            isValidNewTier(newTier),
            "The new tier conflicts with an existing one or is invalid"
        );

        tiers.push(newTier);
        return tiers.length - 1;
    }

    function setMaxLength(uint256 len) public onlyOwner {
        require(len != MAX_LENGTH, "This is already the max length");
        MAX_LENGTH = len;
    }

    function clearTiers() public onlyOwner {
        delete tiers;
    }

    function removeTier(uint256 index) public onlyOwner {
        require(index < tiers.length, "Invalid Tier index");

        tiers[index] = tiers[tiers.length - 1];
        tiers.pop();
    }

    function isValidNewTier(Tier memory newTier) internal view returns (bool) {
        for (uint256 i = 0; i < tiers.length; i++) {
            bool isOverlapping = (newTier.len_from >= tiers[i].len_from &&
                newTier.len_from <= tiers[i].len_to) ||
                (newTier.len_to >= tiers[i].len_from &&
                    newTier.len_to <= tiers[i].len_to) ||
                (newTier.len_from <= tiers[i].len_from &&
                    newTier.len_to >= tiers[i].len_to);

            if (isOverlapping) return false;
        }
        return true;
    }

    function getPricePerYear(string memory name) public view returns (uint256) {
        uint256 length = bytes(name).length;
        for (uint256 i = 0; i < tiers.length; i++) {
            uint256 currentTierMaxLen = tiers[i].len_to == MAX_LENGTH
                ? MAX_LENGTH
                : (tiers[i].len_to > MAX_LENGTH ? MAX_LENGTH : tiers[i].len_to);
            if (length >= tiers[i].len_from && length <= currentTierMaxLen) {
                return tiers[i].pricePerYear;
            }
        }
        revert("No suitable tier found");
    }
}
