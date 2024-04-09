import {
  AllowListUpdated as AllowListUpdatedEvent,
  AllowedFeeRecipientUpdated as AllowedFeeRecipientUpdatedEvent,
  CreatorPayoutAddressUpdated as CreatorPayoutAddressUpdatedEvent,
  DropURIUpdated as DropURIUpdatedEvent,
  PayerUpdated as PayerUpdatedEvent,
  PublicDropUpdated as PublicDropUpdatedEvent,
  ShibaDropMint as ShibaDropMintEvent,
  SignedMintValidationParamsUpdated as SignedMintValidationParamsUpdatedEvent,
  TokenGatedDropStageUpdated as TokenGatedDropStageUpdatedEvent,
} from "../generated/ShibaDrop/ShibaDrop";
import {
  AllowListUpdated,
  AllowedFeeRecipientUpdated,
  CreatorPayoutAddressUpdated,
  DropURIUpdated,
  PayerUpdated,
  PublicDropUpdated,
  ShibaDropMint,
  SignedMintValidationParamsUpdated,
  TokenGatedDropStageUpdated,
} from "../generated/schema";

export function handleAllowListUpdated(event: AllowListUpdatedEvent): void {
  let entity = new AllowListUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.previousMerkleRoot = event.params.previousMerkleRoot;
  entity.newMerkleRoot = event.params.newMerkleRoot;
  entity.publicKeyURI = event.params.publicKeyURI;
  entity.allowListURI = event.params.allowListURI;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleAllowedFeeRecipientUpdated(
  event: AllowedFeeRecipientUpdatedEvent
): void {
  let entity = new AllowedFeeRecipientUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.feeRecipient = event.params.feeRecipient;
  entity.allowed = event.params.allowed;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleCreatorPayoutAddressUpdated(
  event: CreatorPayoutAddressUpdatedEvent
): void {
  let entity = new CreatorPayoutAddressUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.newPayoutAddress = event.params.newPayoutAddress;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleDropURIUpdated(event: DropURIUpdatedEvent): void {
  let entity = new DropURIUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.newDropURI = event.params.newDropURI;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handlePayerUpdated(event: PayerUpdatedEvent): void {
  let entity = new PayerUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.payer = event.params.payer;
  entity.allowed = event.params.allowed;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handlePublicDropUpdated(event: PublicDropUpdatedEvent): void {
  let entity = new PublicDropUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.publicDrop_mintPrice = event.params.publicDrop.mintPrice;
  entity.publicDrop_startTime = event.params.publicDrop.startTime;
  entity.publicDrop_endTime = event.params.publicDrop.endTime;
  entity.publicDrop_maxTotalMintableByWallet =
    event.params.publicDrop.maxTotalMintableByWallet;
  entity.publicDrop_feeBps = event.params.publicDrop.feeBps;
  entity.publicDrop_restrictFeeRecipients =
    event.params.publicDrop.restrictFeeRecipients;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleShibaDropMint(event: ShibaDropMintEvent): void {
  let entity = new ShibaDropMint(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.minter = event.params.minter;
  entity.feeRecipient = event.params.feeRecipient;
  entity.payer = event.params.payer;
  entity.quantityMinted = event.params.quantityMinted;
  entity.unitMintPrice = event.params.unitMintPrice;
  entity.feeBps = event.params.feeBps;
  entity.dropStageIndex = event.params.dropStageIndex;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleSignedMintValidationParamsUpdated(
  event: SignedMintValidationParamsUpdatedEvent
): void {
  let entity = new SignedMintValidationParamsUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.signer = event.params.signer;
  entity.signedMintValidationParams_minMintPrice =
    event.params.signedMintValidationParams.minMintPrice;
  entity.signedMintValidationParams_maxMaxTotalMintableByWallet =
    event.params.signedMintValidationParams.maxMaxTotalMintableByWallet;
  entity.signedMintValidationParams_minStartTime =
    event.params.signedMintValidationParams.minStartTime;
  entity.signedMintValidationParams_maxEndTime =
    event.params.signedMintValidationParams.maxEndTime;
  entity.signedMintValidationParams_maxMaxTokenSupplyForStage =
    event.params.signedMintValidationParams.maxMaxTokenSupplyForStage;
  entity.signedMintValidationParams_minFeeBps =
    event.params.signedMintValidationParams.minFeeBps;
  entity.signedMintValidationParams_maxFeeBps =
    event.params.signedMintValidationParams.maxFeeBps;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleTokenGatedDropStageUpdated(
  event: TokenGatedDropStageUpdatedEvent
): void {
  let entity = new TokenGatedDropStageUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.nftContract = event.params.nftContract;
  entity.allowedNftToken = event.params.allowedNftToken;
  entity.dropStage_mintPrice = event.params.dropStage.mintPrice;
  entity.dropStage_maxTotalMintableByWallet =
    event.params.dropStage.maxTotalMintableByWallet;
  entity.dropStage_startTime = event.params.dropStage.startTime;
  entity.dropStage_endTime = event.params.dropStage.endTime;
  entity.dropStage_dropStageIndex = event.params.dropStage.dropStageIndex;
  entity.dropStage_maxTokenSupplyForStage =
    event.params.dropStage.maxTokenSupplyForStage;
  entity.dropStage_feeBps = event.params.dropStage.feeBps;
  entity.dropStage_restrictFeeRecipients =
    event.params.dropStage.restrictFeeRecipients;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}
