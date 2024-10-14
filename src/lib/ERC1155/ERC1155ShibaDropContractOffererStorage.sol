// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { PublicDrop } from "./ERC1155ShibaDropStructs.sol";

import { CreatorPayout } from "./ShibaDropStructs.sol";

library ERC1155ShibaDropContractOffererStorage {
    struct Layout {
        /// @notice The allowed Shibaport addresses that can mint.
        mapping(address => bool) _allowedShibaport;
        /// @notice The enumerated allowed Shibaport addresses.
        address[] _enumeratedAllowedShibaport;
        /// @notice The public drop data.
        mapping(uint256 => PublicDrop) _publicDrops;
        /// @notice The enumerated public drop indexes.
        uint256[] _enumeratedPublicDropIndexes;
        /// @notice The creator payout addresses and basis points.
        CreatorPayout[] _creatorPayouts;
        /// @notice The allow list merkle root.
        bytes32 _allowListMerkleRoot;
        /// @notice The allowed fee recipients.
        mapping(address => bool) _allowedFeeRecipients;
        /// @notice The enumerated allowed fee recipients.
        address[] _enumeratedFeeRecipients;
        /// @notice The allowed server-side signers.
        mapping(address => bool) _allowedSigners;
        /// @notice The enumerated allowed signers.
        address[] _enumeratedSigners;
        /// @notice The used signature digests.
        mapping(bytes32 => bool) _usedDigests;
        /// @notice The allowed payers.
        mapping(address => bool) _allowedPayers;
        /// @notice The enumerated allowed payers.
        address[] _enumeratedPayers;
    }

    bytes32 internal constant STORAGE_SLOT =
        bytes32(
            uint256(
                keccak256("contracts.storage.ERC1155SeaDropContractOfferer")
            ) - 1
        );

    function layout() internal pure returns (Layout storage l) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            l.slot := slot
        }
    }
}
