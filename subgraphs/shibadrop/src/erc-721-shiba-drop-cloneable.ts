import {
  AllowedShibaDropUpdated as AllowedShibaDropUpdatedEvent,
  Approval as ApprovalEvent,
  ApprovalForAll as ApprovalForAllEvent,
  BatchMetadataUpdate as BatchMetadataUpdateEvent,
  ConsecutiveTransfer as ConsecutiveTransferEvent,
  ContractURIUpdated as ContractURIUpdatedEvent,
  Initialized as InitializedEvent,
  MaxSupplyUpdated as MaxSupplyUpdatedEvent,
  OwnershipTransferred as OwnershipTransferredEvent,
  PotentialOwnerUpdated as PotentialOwnerUpdatedEvent,
  ProvenanceHashUpdated as ProvenanceHashUpdatedEvent,
  RoyaltyInfoUpdated as RoyaltyInfoUpdatedEvent,
  ShibaDropTokenDeployed as ShibaDropTokenDeployedEvent,
  Transfer as TransferEvent,
  TransferValidatorUpdated as TransferValidatorUpdatedEvent,
} from "../generated/ERC721ShibaDropCloneable/ERC721ShibaDropCloneable"
import {
  AllowedShibaDropUpdated,
  Approval,
  ApprovalForAll,
  BatchMetadataUpdate,
  ConsecutiveTransfer,
  ContractURIUpdated,
  Initialized,
  MaxSupplyUpdated,
  OwnershipTransferred,
  PotentialOwnerUpdated,
  ProvenanceHashUpdated,
  RoyaltyInfoUpdated,
  ShibaDropTokenDeployed,
  Transfer,
  TransferValidatorUpdated,
} from "../generated/schema"

export function handleAllowedShibaDropUpdated(
  event: AllowedShibaDropUpdatedEvent,
): void {
  let entity = new AllowedShibaDropUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.allowedShibaDrop = event.params.allowedShibaDrop

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleApproval(event: ApprovalEvent): void {
  let entity = new Approval(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.owner = event.params.owner
  entity.approved = event.params.approved
  entity.tokenId = event.params.tokenId

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleApprovalForAll(event: ApprovalForAllEvent): void {
  let entity = new ApprovalForAll(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.owner = event.params.owner
  entity.operator = event.params.operator
  entity.approved = event.params.approved

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleBatchMetadataUpdate(
  event: BatchMetadataUpdateEvent,
): void {
  let entity = new BatchMetadataUpdate(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity._fromTokenId = event.params._fromTokenId
  entity._toTokenId = event.params._toTokenId

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleConsecutiveTransfer(
  event: ConsecutiveTransferEvent,
): void {
  let entity = new ConsecutiveTransfer(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.fromTokenId = event.params.fromTokenId
  entity.toTokenId = event.params.toTokenId
  entity.from = event.params.from
  entity.to = event.params.to

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleContractURIUpdated(event: ContractURIUpdatedEvent): void {
  let entity = new ContractURIUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.newContractURI = event.params.newContractURI

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleInitialized(event: InitializedEvent): void {
  let entity = new Initialized(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.version = event.params.version

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleMaxSupplyUpdated(event: MaxSupplyUpdatedEvent): void {
  let entity = new MaxSupplyUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.newMaxSupply = event.params.newMaxSupply

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleOwnershipTransferred(
  event: OwnershipTransferredEvent,
): void {
  let entity = new OwnershipTransferred(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.previousOwner = event.params.previousOwner
  entity.newOwner = event.params.newOwner

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handlePotentialOwnerUpdated(
  event: PotentialOwnerUpdatedEvent,
): void {
  let entity = new PotentialOwnerUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.newPotentialAdministrator = event.params.newPotentialAdministrator

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleProvenanceHashUpdated(
  event: ProvenanceHashUpdatedEvent,
): void {
  let entity = new ProvenanceHashUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.previousHash = event.params.previousHash
  entity.newHash = event.params.newHash

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleRoyaltyInfoUpdated(event: RoyaltyInfoUpdatedEvent): void {
  let entity = new RoyaltyInfoUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.receiver = event.params.receiver
  entity.bps = event.params.bps

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleShibaDropTokenDeployed(
  event: ShibaDropTokenDeployedEvent,
): void {
  let entity = new ShibaDropTokenDeployed(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleTransfer(event: TransferEvent): void {
  let entity = new Transfer(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.from = event.params.from
  entity.to = event.params.to
  entity.tokenId = event.params.tokenId

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}

export function handleTransferValidatorUpdated(
  event: TransferValidatorUpdatedEvent,
): void {
  let entity = new TransferValidatorUpdated(
    event.transaction.hash.concatI32(event.logIndex.toI32()),
  )
  entity.oldValidator = event.params.oldValidator
  entity.newValidator = event.params.newValidator

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}
