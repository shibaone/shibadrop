import { newMockEvent } from "matchstick-as"
import { ethereum, Bytes, Address, BigInt } from "@graphprotocol/graph-ts"
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
  URI
} from "../generated/ERC1155ShibaDropCloneable/ERC1155ShibaDropCloneable"

export function createAllowListUpdatedEvent(
  previousMerkleRoot: Bytes,
  newMerkleRoot: Bytes,
  publicKeyURI: Array<string>,
  allowListURI: string
): AllowListUpdated {
  let allowListUpdatedEvent = changetype<AllowListUpdated>(newMockEvent())

  allowListUpdatedEvent.parameters = new Array()

  allowListUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "previousMerkleRoot",
      ethereum.Value.fromFixedBytes(previousMerkleRoot)
    )
  )
  allowListUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "newMerkleRoot",
      ethereum.Value.fromFixedBytes(newMerkleRoot)
    )
  )
  allowListUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "publicKeyURI",
      ethereum.Value.fromStringArray(publicKeyURI)
    )
  )
  allowListUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "allowListURI",
      ethereum.Value.fromString(allowListURI)
    )
  )

  return allowListUpdatedEvent
}

export function createAllowedFeeRecipientUpdatedEvent(
  feeRecipient: Address,
  allowed: boolean
): AllowedFeeRecipientUpdated {
  let allowedFeeRecipientUpdatedEvent = changetype<AllowedFeeRecipientUpdated>(
    newMockEvent()
  )

  allowedFeeRecipientUpdatedEvent.parameters = new Array()

  allowedFeeRecipientUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "feeRecipient",
      ethereum.Value.fromAddress(feeRecipient)
    )
  )
  allowedFeeRecipientUpdatedEvent.parameters.push(
    new ethereum.EventParam("allowed", ethereum.Value.fromBoolean(allowed))
  )

  return allowedFeeRecipientUpdatedEvent
}

export function createAllowedSeaportUpdatedEvent(
  allowedShibaport: Array<Address>
): AllowedSeaportUpdated {
  let allowedSeaportUpdatedEvent = changetype<AllowedSeaportUpdated>(
    newMockEvent()
  )

  allowedSeaportUpdatedEvent.parameters = new Array()

  allowedSeaportUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "allowedShibaport",
      ethereum.Value.fromAddressArray(allowedShibaport)
    )
  )

  return allowedSeaportUpdatedEvent
}

export function createApprovalForAllEvent(
  owner: Address,
  operator: Address,
  isApproved: boolean
): ApprovalForAll {
  let approvalForAllEvent = changetype<ApprovalForAll>(newMockEvent())

  approvalForAllEvent.parameters = new Array()

  approvalForAllEvent.parameters.push(
    new ethereum.EventParam("owner", ethereum.Value.fromAddress(owner))
  )
  approvalForAllEvent.parameters.push(
    new ethereum.EventParam("operator", ethereum.Value.fromAddress(operator))
  )
  approvalForAllEvent.parameters.push(
    new ethereum.EventParam(
      "isApproved",
      ethereum.Value.fromBoolean(isApproved)
    )
  )

  return approvalForAllEvent
}

export function createBatchMetadataUpdateEvent(
  _fromTokenId: BigInt,
  _toTokenId: BigInt
): BatchMetadataUpdate {
  let batchMetadataUpdateEvent = changetype<BatchMetadataUpdate>(newMockEvent())

  batchMetadataUpdateEvent.parameters = new Array()

  batchMetadataUpdateEvent.parameters.push(
    new ethereum.EventParam(
      "_fromTokenId",
      ethereum.Value.fromUnsignedBigInt(_fromTokenId)
    )
  )
  batchMetadataUpdateEvent.parameters.push(
    new ethereum.EventParam(
      "_toTokenId",
      ethereum.Value.fromUnsignedBigInt(_toTokenId)
    )
  )

  return batchMetadataUpdateEvent
}

export function createContractURIUpdatedEvent(
  newContractURI: string
): ContractURIUpdated {
  let contractUriUpdatedEvent = changetype<ContractURIUpdated>(newMockEvent())

  contractUriUpdatedEvent.parameters = new Array()

  contractUriUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "newContractURI",
      ethereum.Value.fromString(newContractURI)
    )
  )

  return contractUriUpdatedEvent
}

export function createCreatorPayoutsUpdatedEvent(
  creatorPayouts: Array<ethereum.Tuple>
): CreatorPayoutsUpdated {
  let creatorPayoutsUpdatedEvent = changetype<CreatorPayoutsUpdated>(
    newMockEvent()
  )

  creatorPayoutsUpdatedEvent.parameters = new Array()

  creatorPayoutsUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "creatorPayouts",
      ethereum.Value.fromTupleArray(creatorPayouts)
    )
  )

  return creatorPayoutsUpdatedEvent
}

export function createDropURIUpdatedEvent(newDropURI: string): DropURIUpdated {
  let dropUriUpdatedEvent = changetype<DropURIUpdated>(newMockEvent())

  dropUriUpdatedEvent.parameters = new Array()

  dropUriUpdatedEvent.parameters.push(
    new ethereum.EventParam("newDropURI", ethereum.Value.fromString(newDropURI))
  )

  return dropUriUpdatedEvent
}

export function createInitializedEvent(version: i32): Initialized {
  let initializedEvent = changetype<Initialized>(newMockEvent())

  initializedEvent.parameters = new Array()

  initializedEvent.parameters.push(
    new ethereum.EventParam(
      "version",
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(version))
    )
  )

  return initializedEvent
}

export function createMaxSupplyUpdatedEvent(
  tokenId: BigInt,
  newMaxSupply: BigInt
): MaxSupplyUpdated {
  let maxSupplyUpdatedEvent = changetype<MaxSupplyUpdated>(newMockEvent())

  maxSupplyUpdatedEvent.parameters = new Array()

  maxSupplyUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "tokenId",
      ethereum.Value.fromUnsignedBigInt(tokenId)
    )
  )
  maxSupplyUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "newMaxSupply",
      ethereum.Value.fromUnsignedBigInt(newMaxSupply)
    )
  )

  return maxSupplyUpdatedEvent
}

export function createOwnershipHandoverCanceledEvent(
  pendingOwner: Address
): OwnershipHandoverCanceled {
  let ownershipHandoverCanceledEvent = changetype<OwnershipHandoverCanceled>(
    newMockEvent()
  )

  ownershipHandoverCanceledEvent.parameters = new Array()

  ownershipHandoverCanceledEvent.parameters.push(
    new ethereum.EventParam(
      "pendingOwner",
      ethereum.Value.fromAddress(pendingOwner)
    )
  )

  return ownershipHandoverCanceledEvent
}

export function createOwnershipHandoverRequestedEvent(
  pendingOwner: Address
): OwnershipHandoverRequested {
  let ownershipHandoverRequestedEvent = changetype<OwnershipHandoverRequested>(
    newMockEvent()
  )

  ownershipHandoverRequestedEvent.parameters = new Array()

  ownershipHandoverRequestedEvent.parameters.push(
    new ethereum.EventParam(
      "pendingOwner",
      ethereum.Value.fromAddress(pendingOwner)
    )
  )

  return ownershipHandoverRequestedEvent
}

export function createOwnershipTransferredEvent(
  oldOwner: Address,
  newOwner: Address
): OwnershipTransferred {
  let ownershipTransferredEvent = changetype<OwnershipTransferred>(
    newMockEvent()
  )

  ownershipTransferredEvent.parameters = new Array()

  ownershipTransferredEvent.parameters.push(
    new ethereum.EventParam("oldOwner", ethereum.Value.fromAddress(oldOwner))
  )
  ownershipTransferredEvent.parameters.push(
    new ethereum.EventParam("newOwner", ethereum.Value.fromAddress(newOwner))
  )

  return ownershipTransferredEvent
}

export function createPayerUpdatedEvent(
  payer: Address,
  allowed: boolean
): PayerUpdated {
  let payerUpdatedEvent = changetype<PayerUpdated>(newMockEvent())

  payerUpdatedEvent.parameters = new Array()

  payerUpdatedEvent.parameters.push(
    new ethereum.EventParam("payer", ethereum.Value.fromAddress(payer))
  )
  payerUpdatedEvent.parameters.push(
    new ethereum.EventParam("allowed", ethereum.Value.fromBoolean(allowed))
  )

  return payerUpdatedEvent
}

export function createProvenanceHashUpdatedEvent(
  previousHash: Bytes,
  newHash: Bytes
): ProvenanceHashUpdated {
  let provenanceHashUpdatedEvent = changetype<ProvenanceHashUpdated>(
    newMockEvent()
  )

  provenanceHashUpdatedEvent.parameters = new Array()

  provenanceHashUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "previousHash",
      ethereum.Value.fromFixedBytes(previousHash)
    )
  )
  provenanceHashUpdatedEvent.parameters.push(
    new ethereum.EventParam("newHash", ethereum.Value.fromFixedBytes(newHash))
  )

  return provenanceHashUpdatedEvent
}

export function createPublicDropUpdatedEvent(
  publicDrop: ethereum.Tuple,
  index: BigInt
): PublicDropUpdated {
  let publicDropUpdatedEvent = changetype<PublicDropUpdated>(newMockEvent())

  publicDropUpdatedEvent.parameters = new Array()

  publicDropUpdatedEvent.parameters.push(
    new ethereum.EventParam("publicDrop", ethereum.Value.fromTuple(publicDrop))
  )
  publicDropUpdatedEvent.parameters.push(
    new ethereum.EventParam("index", ethereum.Value.fromUnsignedBigInt(index))
  )

  return publicDropUpdatedEvent
}

export function createRoyaltyInfoUpdatedEvent(
  receiver: Address,
  basisPoints: BigInt
): RoyaltyInfoUpdated {
  let royaltyInfoUpdatedEvent = changetype<RoyaltyInfoUpdated>(newMockEvent())

  royaltyInfoUpdatedEvent.parameters = new Array()

  royaltyInfoUpdatedEvent.parameters.push(
    new ethereum.EventParam("receiver", ethereum.Value.fromAddress(receiver))
  )
  royaltyInfoUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "basisPoints",
      ethereum.Value.fromUnsignedBigInt(basisPoints)
    )
  )

  return royaltyInfoUpdatedEvent
}

export function createSeaDropMintEvent(
  payer: Address,
  dropStageIndex: BigInt
): SeaDropMint {
  let seaDropMintEvent = changetype<SeaDropMint>(newMockEvent())

  seaDropMintEvent.parameters = new Array()

  seaDropMintEvent.parameters.push(
    new ethereum.EventParam("payer", ethereum.Value.fromAddress(payer))
  )
  seaDropMintEvent.parameters.push(
    new ethereum.EventParam(
      "dropStageIndex",
      ethereum.Value.fromUnsignedBigInt(dropStageIndex)
    )
  )

  return seaDropMintEvent
}

export function createSeaDropTokenDeployedEvent(
  tokenType: i32
): SeaDropTokenDeployed {
  let seaDropTokenDeployedEvent = changetype<SeaDropTokenDeployed>(
    newMockEvent()
  )

  seaDropTokenDeployedEvent.parameters = new Array()

  seaDropTokenDeployedEvent.parameters.push(
    new ethereum.EventParam(
      "tokenType",
      ethereum.Value.fromUnsignedBigInt(BigInt.fromI32(tokenType))
    )
  )

  return seaDropTokenDeployedEvent
}

export function createSignerUpdatedEvent(
  signer: Address,
  allowed: boolean
): SignerUpdated {
  let signerUpdatedEvent = changetype<SignerUpdated>(newMockEvent())

  signerUpdatedEvent.parameters = new Array()

  signerUpdatedEvent.parameters.push(
    new ethereum.EventParam("signer", ethereum.Value.fromAddress(signer))
  )
  signerUpdatedEvent.parameters.push(
    new ethereum.EventParam("allowed", ethereum.Value.fromBoolean(allowed))
  )

  return signerUpdatedEvent
}

export function createTransferBatchEvent(
  operator: Address,
  from: Address,
  to: Address,
  ids: Array<BigInt>,
  amounts: Array<BigInt>
): TransferBatch {
  let transferBatchEvent = changetype<TransferBatch>(newMockEvent())

  transferBatchEvent.parameters = new Array()

  transferBatchEvent.parameters.push(
    new ethereum.EventParam("operator", ethereum.Value.fromAddress(operator))
  )
  transferBatchEvent.parameters.push(
    new ethereum.EventParam("from", ethereum.Value.fromAddress(from))
  )
  transferBatchEvent.parameters.push(
    new ethereum.EventParam("to", ethereum.Value.fromAddress(to))
  )
  transferBatchEvent.parameters.push(
    new ethereum.EventParam("ids", ethereum.Value.fromUnsignedBigIntArray(ids))
  )
  transferBatchEvent.parameters.push(
    new ethereum.EventParam(
      "amounts",
      ethereum.Value.fromUnsignedBigIntArray(amounts)
    )
  )

  return transferBatchEvent
}

export function createTransferSingleEvent(
  operator: Address,
  from: Address,
  to: Address,
  id: BigInt,
  amount: BigInt
): TransferSingle {
  let transferSingleEvent = changetype<TransferSingle>(newMockEvent())

  transferSingleEvent.parameters = new Array()

  transferSingleEvent.parameters.push(
    new ethereum.EventParam("operator", ethereum.Value.fromAddress(operator))
  )
  transferSingleEvent.parameters.push(
    new ethereum.EventParam("from", ethereum.Value.fromAddress(from))
  )
  transferSingleEvent.parameters.push(
    new ethereum.EventParam("to", ethereum.Value.fromAddress(to))
  )
  transferSingleEvent.parameters.push(
    new ethereum.EventParam("id", ethereum.Value.fromUnsignedBigInt(id))
  )
  transferSingleEvent.parameters.push(
    new ethereum.EventParam("amount", ethereum.Value.fromUnsignedBigInt(amount))
  )

  return transferSingleEvent
}

export function createTransferValidatorUpdatedEvent(
  oldValidator: Address,
  newValidator: Address
): TransferValidatorUpdated {
  let transferValidatorUpdatedEvent = changetype<TransferValidatorUpdated>(
    newMockEvent()
  )

  transferValidatorUpdatedEvent.parameters = new Array()

  transferValidatorUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "oldValidator",
      ethereum.Value.fromAddress(oldValidator)
    )
  )
  transferValidatorUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "newValidator",
      ethereum.Value.fromAddress(newValidator)
    )
  )

  return transferValidatorUpdatedEvent
}

export function createURIEvent(value: string, id: BigInt): URI {
  let uriEvent = changetype<URI>(newMockEvent())

  uriEvent.parameters = new Array()

  uriEvent.parameters.push(
    new ethereum.EventParam("value", ethereum.Value.fromString(value))
  )
  uriEvent.parameters.push(
    new ethereum.EventParam("id", ethereum.Value.fromUnsignedBigInt(id))
  )

  return uriEvent
}
