// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {
  AllowListData,
  PublicDrop,
  SignedMintValidationParams,
  TokenGatedDropStage
} from "./ShibaDropStructs.sol";

interface ERC721ShibaDropStructsErrorsAndEvents {
  /**
   * @notice Revert with an error if mint exceeds the max supply.
   */
  error MintQuantityExceedsMaxSupply(uint256 total, uint256 maxSupply);

  /**
   * @notice Revert with an error if the number of token gated 
   *         allowedNftTokens doesn't match the length of supplied
   *         drop stages.
   */
  error TokenGatedMismatch();

  /**
   *  @notice Revert with an error if the number of signers doesn't match
   *          the length of supplied signedMintValidationParams
   */
  error SignersMismatch();

  /**
   * @notice An event to signify that a ShibaDrop token contract was deployed.
   */
  event ShibaDropTokenDeployed();

  /**
   * @notice A struct to configure multiple contract options at a time.
   */
  struct MultiConfigureStruct {
    uint256 maxSupply;
    string baseURI;
    string contractURI;
    address shibaDropImpl;
    PublicDrop publicDrop;
    string dropURI;
    AllowListData allowListData;
    address creatorPayoutAddress;
    bytes32 provenanceHash;

    address[] allowedFeeRecipients;
    address[] disallowedFeeRecipients;

    address[] allowedPayers;
    address[] disallowedPayers;

    // Token-gated
    address[] tokenGatedAllowedNftTokens;
    TokenGatedDropStage[] tokenGatedDropStages;
    address[] disallowedTokenGatedAllowedNftTokens;

    // Server-signed
    address[] signers;
    SignedMintValidationParams[] signedMintValidationParams;
    address[] disallowedSigners;
  }
}