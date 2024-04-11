import { Address, Bytes } from "@graphprotocol/graph-ts";
import {
  AllowListUpdated as AllowListUpdatedEvent,
  AllowedFeeRecipientUpdated as AllowedFeeRecipientUpdatedEvent,
  AllowedSeaportUpdated as AllowedSeaportUpdatedEvent,
  ApprovalForAll as ApprovalForAllEvent,
  BatchMetadataUpdate as BatchMetadataUpdateEvent,
  ContractURIUpdated as ContractURIUpdatedEvent,
  CreatorPayoutsUpdated as CreatorPayoutsUpdatedEvent,
  DropURIUpdated as DropURIUpdatedEvent,
  Initialized as InitializedEvent,
  MaxSupplyUpdated as MaxSupplyUpdatedEvent,
  OwnershipHandoverCanceled as OwnershipHandoverCanceledEvent,
  OwnershipHandoverRequested as OwnershipHandoverRequestedEvent,
  OwnershipTransferred as OwnershipTransferredEvent,
  PayerUpdated as PayerUpdatedEvent,
  ProvenanceHashUpdated as ProvenanceHashUpdatedEvent,
  PublicDropUpdated as PublicDropUpdatedEvent,
  RoyaltyInfoUpdated as RoyaltyInfoUpdatedEvent,
  SeaDropMint as SeaDropMintEvent,
  SeaDropTokenDeployed as SeaDropTokenDeployedEvent,
  SignerUpdated as SignerUpdatedEvent,
  TransferBatch as TransferBatchEvent,
  TransferSingle as TransferSingleEvent,
  TransferValidatorUpdated as TransferValidatorUpdatedEvent,
  URI as URIEvent,
} from "../generated/ERC1155ShibaDropCloneable/ERC1155ShibaDropCloneable";
import {
  AllowListUpdated,
  AllowedFeeRecipientUpdated,
  AllowedSeaportUpdated,
  ApprovalForAll,
  BatchMetadataUpdate,
  ContractURIUpdated,
  CreatorPayoutsUpdated,
  DropURIUpdated,
  Initialized,
  MaxSupplyUpdated,
  OwnershipHandoverCanceled,
  OwnershipHandoverRequested,
  OwnershipTransferred,
  PayerUpdated,
  ProvenanceHashUpdated,
  PublicDropUpdated,
  RoyaltyInfoUpdated,
  SeaDropMint,
  SeaDropTokenDeployed,
  SignerUpdated,
  TransferBatch,
  TransferSingle,
  TransferValidatorUpdated,
  URI,
} from "../generated/schema";

export function handleAllowListUpdated(event: AllowListUpdatedEvent): void {
  let entity = new AllowListUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
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
  entity.feeRecipient = event.params.feeRecipient;
  entity.allowed = event.params.allowed;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleAllowedSeaportUpdated(
  event: AllowedSeaportUpdatedEvent
): void {
  let entity = new AllowedSeaportUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.allowedShibaport = changetype<Bytes[]>(event.params.allowedShibaport);

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleApprovalForAll(event: ApprovalForAllEvent): void {
  let entity = new ApprovalForAll(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.owner = event.params.owner;
  entity.operator = event.params.operator;
  entity.isApproved = event.params.isApproved;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleBatchMetadataUpdate(
  event: BatchMetadataUpdateEvent
): void {
  let entity = new BatchMetadataUpdate(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity._fromTokenId = event.params._fromTokenId;
  entity._toTokenId = event.params._toTokenId;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleContractURIUpdated(event: ContractURIUpdatedEvent): void {
  let entity = new ContractURIUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.newContractURI = event.params.newContractURI;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleCreatorPayoutsUpdated(
  event: CreatorPayoutsUpdatedEvent
): void {
  let entity = new CreatorPayoutsUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );

  entity.creatorPayouts = changetype<Bytes[]>(event.params.creatorPayouts);

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleDropURIUpdated(event: DropURIUpdatedEvent): void {
  let entity = new DropURIUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.newDropURI = event.params.newDropURI;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleInitialized(event: InitializedEvent): void {
  let entity = new Initialized(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.version = event.params.version;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleMaxSupplyUpdated(event: MaxSupplyUpdatedEvent): void {
  let entity = new MaxSupplyUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.tokenId = event.params.tokenId;
  entity.newMaxSupply = event.params.newMaxSupply;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleOwnershipHandoverCanceled(
  event: OwnershipHandoverCanceledEvent
): void {
  let entity = new OwnershipHandoverCanceled(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.pendingOwner = event.params.pendingOwner;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleOwnershipHandoverRequested(
  event: OwnershipHandoverRequestedEvent
): void {
  let entity = new OwnershipHandoverRequested(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.pendingOwner = event.params.pendingOwner;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleOwnershipTransferred(
  event: OwnershipTransferredEvent
): void {
  let entity = new OwnershipTransferred(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.oldOwner = event.params.oldOwner;
  entity.newOwner = event.params.newOwner;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handlePayerUpdated(event: PayerUpdatedEvent): void {
  let entity = new PayerUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.payer = event.params.payer;
  entity.allowed = event.params.allowed;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleProvenanceHashUpdated(
  event: ProvenanceHashUpdatedEvent
): void {
  let entity = new ProvenanceHashUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.previousHash = event.params.previousHash;
  entity.newHash = event.params.newHash;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handlePublicDropUpdated(event: PublicDropUpdatedEvent): void {
  let entity = new PublicDropUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.publicDrop_startPrice = event.params.publicDrop.startPrice;
  entity.publicDrop_endPrice = event.params.publicDrop.endPrice;
  entity.publicDrop_startTime = event.params.publicDrop.startTime;
  entity.publicDrop_endTime = event.params.publicDrop.endTime;
  entity.publicDrop_restrictFeeRecipients =
    event.params.publicDrop.restrictFeeRecipients;
  entity.publicDrop_paymentToken = event.params.publicDrop.paymentToken;
  entity.publicDrop_fromTokenId = event.params.publicDrop.fromTokenId;
  entity.publicDrop_toTokenId = event.params.publicDrop.toTokenId;
  entity.publicDrop_maxTotalMintableByWallet =
    event.params.publicDrop.maxTotalMintableByWallet;
  entity.publicDrop_maxTotalMintableByWalletPerToken =
    event.params.publicDrop.maxTotalMintableByWalletPerToken;
  entity.publicDrop_feeBps = event.params.publicDrop.feeBps;
  entity.index = event.params.index;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleRoyaltyInfoUpdated(event: RoyaltyInfoUpdatedEvent): void {
  let entity = new RoyaltyInfoUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.receiver = event.params.receiver;
  entity.basisPoints = event.params.basisPoints;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleSeaDropMint(event: SeaDropMintEvent): void {
  let entity = new SeaDropMint(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.payer = event.params.payer;
  entity.dropStageIndex = event.params.dropStageIndex;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleSeaDropTokenDeployed(
  event: SeaDropTokenDeployedEvent
): void {
  let entity = new SeaDropTokenDeployed(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.tokenType = event.params.tokenType;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleSignerUpdated(event: SignerUpdatedEvent): void {
  let entity = new SignerUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.signer = event.params.signer;
  entity.allowed = event.params.allowed;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleTransferBatch(event: TransferBatchEvent): void {
  let entity = new TransferBatch(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.operator = event.params.operator;
  entity.from = event.params.from;
  entity.to = event.params.to;
  entity.ids = event.params.ids;
  entity.amounts = event.params.amounts;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleTransferSingle(event: TransferSingleEvent): void {
  let entity = new TransferSingle(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.operator = event.params.operator;
  entity.from = event.params.from;
  entity.to = event.params.to;
  entity.ERC1155ShibaDropCloneable_id = event.params.id;
  entity.amount = event.params.amount;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleTransferValidatorUpdated(
  event: TransferValidatorUpdatedEvent
): void {
  let entity = new TransferValidatorUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.oldValidator = event.params.oldValidator;
  entity.newValidator = event.params.newValidator;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}

export function handleURI(event: URIEvent): void {
  let entity = new URI(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.value = event.params.value;
  entity.ERC1155ShibaDropCloneable_id = event.params.id;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  entity.save();
}
