// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

library StringUtils {
    function toLowerCase(string memory str)
        internal
        pure
        returns (string memory)
    {
        bytes memory bStr = bytes(str);
        bytes memory bLower = new bytes(bStr.length);
        for (uint256 i = 0; i < bStr.length; i++) {
            if ((uint8(bStr[i]) >= 65) && (uint8(bStr[i]) <= 90)) {
                bLower[i] = bytes1(uint8(bStr[i]) + 32);
            } else {
                bLower[i] = bStr[i];
            }
        }
        return string(bLower);
    }

    function containsInvalidCharacters(string memory str)
        internal
        pure
        returns (bool)
    {
        bytes memory bStr = bytes(str);
        if (bStr.length == 0) return false;
        for (uint256 i = 0; i < bStr.length; i++) {
            bytes1 b = bStr[i];
            // Check for lowercase letters a-z
            bool isLowercaseLetter = (b >= 0x61 && b <= 0x7A);
            // Check for numbers 0-9
            bool isNumber = (b >= 0x30 && b <= 0x39);

            if (!isLowercaseLetter && !isNumber) return true;
        }
        return false;
    }
}
