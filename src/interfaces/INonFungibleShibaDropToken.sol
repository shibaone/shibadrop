// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {
    IShibaDropTokenContractMetadata
} from "./IShibaDropTokenContractMetadata.sol";

import {
    AllowListData,
    PublicDrop,
    TokenGatedDropStage,
    SignedMintValidationParams
} from "../lib/ShibaDropStructs.sol";

interface INonFungibleShibaDropToken is IShibaDropTokenContractMetadata {
    /**
     * @dev Revert with an error if a contract is not an allowed
     *      ShibaDrop address.
     */
    error OnlyAllowedShibaDrop();

    /**
     * @dev Emit an event when allowed ShibaDrop contracts are updated.
     */
    event AllowedShibaDropUpdated(address[] allowedShibaDrop);

    /**
     * @notice Update the allowed ShibaDrop contracts.
     *         Only the owner can use this function.
     *
     * @param allowedShibaDrop The allowed ShibaDrop addresses.
     */
    function updateAllowedShibaDrop(address[] calldata allowedShibaDrop)
        external;

    /**
     * @notice Mint tokens, restricted to the ShibaDrop contract.
     *
     * @dev    NOTE: If a token registers itself with multiple ShibaDrop
     *         contracts, the implementation of this function should guard
     *         against reentrancy. If the implementing token uses
     *         _safeMint(), or a feeRecipient with a malicious receive() hook
     *         is specified, the token or fee recipients may be able to execute
     *         another mint in the same transaction via a separate ShibaDrop
     *         contract.
     *         This is dangerous if an implementing token does not correctly
     *         update the minterNumMinted and currentTotalSupply values before
     *         transferring minted tokens, as ShibaDrop references these values
     *         to enforce token limits on a per-wallet and per-stage basis.
     *
     * @param minter   The address to mint to.
     * @param quantity The number of tokens to mint.
     */
    function mintShibaDrop(address minter, uint256 quantity) external;

    /**
     * @notice Returns a set of mint stats for the address.
     *         This assists ShibaDrop in enforcing maxSupply,
     *         maxTotalMintableByWallet, and maxTokenSupplyForStage checks.
     *
     * @dev    NOTE: Implementing contracts should always update these numbers
     *         before transferring any tokens with _safeMint() to mitigate
     *         consequences of malicious onERC721Received() hooks.
     *
     * @param minter The minter address.
     */
    function getMintStats(address minter)
        external
        view
        returns (
            uint256 minterNumMinted,
            uint256 currentTotalSupply,
            uint256 maxSupply
        );

    /**
     * @notice Update the public drop data for this nft contract on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl The allowed ShibaDrop contract.
     * @param publicDrop  The public drop data.
     */
    function updatePublicDrop(
        address shibaDropImpl,
        PublicDrop calldata publicDrop
    ) external;

    /**
     * @notice Update the allow list data for this nft contract on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl   The allowed ShibaDrop contract.
     * @param allowListData The allow list data.
     */
    function updateAllowList(
        address shibaDropImpl,
        AllowListData calldata allowListData
    ) external;

    /**
     * @notice Update the token gated drop stage data for this nft contract
     *         on ShibaDrop.
     *         Only the owner can use this function.
     *
     *         Note: If two INonFungibleShibaDropToken tokens are doing
     *         simultaneous token gated drop promotions for each other,
     *         they can be minted by the same actor until
     *         `maxTokenSupplyForStage` is reached. Please ensure the
     *         `allowedNftToken` is not running an active drop during the
     *         `dropStage` time period.
     *
     *
     * @param shibaDropImpl     The allowed ShibaDrop contract.
     * @param allowedNftToken The allowed nft token.
     * @param dropStage       The token gated drop stage data.
     */
    function updateTokenGatedDrop(
        address shibaDropImpl,
        address allowedNftToken,
        TokenGatedDropStage calldata dropStage
    ) external;

    /**
     * @notice Update the drop URI for this nft contract on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl The allowed ShibaDrop contract.
     * @param dropURI     The new drop URI.
     */
    function updateDropURI(address shibaDropImpl, string calldata dropURI)
        external;

    /**
     * @notice Update the creator payout address for this nft contract on
     *         ShibaDrop.
     *         Only the owner can set the creator payout address.
     *
     * @param shibaDropImpl   The allowed ShibaDrop contract.
     * @param payoutAddress The new payout address.
     */
    function updateCreatorPayoutAddress(
        address shibaDropImpl,
        address payoutAddress
    ) external;

    /**
     * @notice Update the allowed fee recipient for this nft contract
     *         on ShibaDrop.
     *
     * @param shibaDropImpl  The allowed ShibaDrop contract.
     * @param feeRecipient The new fee recipient.
     */
    function updateAllowedFeeRecipient(
        address shibaDropImpl,
        address feeRecipient,
        bool allowed
    ) external;

    /**
     * @notice Update the server-side signers for this nft contract
     *         on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl                The allowed ShibaDrop contract.
     * @param signer                     The signer to update.
     * @param signedMintValidationParams Minimum and maximum parameters
     *                                   to enforce for signed mints.
     */
    function updateSignedMintValidationParams(
        address shibaDropImpl,
        address signer,
        SignedMintValidationParams memory signedMintValidationParams
    ) external;

    /**
     * @notice Update the allowed payers for this nft contract on ShibaDrop.
     *         Only the owner can use this function.
     *
     * @param shibaDropImpl The allowed ShibaDrop contract.
     * @param payer       The payer to update.
     * @param allowed     Whether the payer is allowed.
     */
    function updatePayer(
        address shibaDropImpl,
        address payer,
        bool allowed
    ) external;
}
