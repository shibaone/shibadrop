// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ERC721ShibaDropStorage {
    struct Layout {
        /// @notice Track the allowed ShibaDrop addresses.
        mapping(address => bool) _allowedSeaDrop;
        /// @notice Track the enumerated allowed ShibaDrop addresses.
        address[] _enumeratedAllowedSeaDrop;
    }

    bytes32 internal constant STORAGE_SLOT =
        keccak256("openzepplin.contracts.storage.ERC721ShibaDrop");

    function layout() internal pure returns (Layout storage l) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            l.slot := slot
        }
    }
}
