import { newMockEvent } from "matchstick-as"
import { ethereum, Address, Bytes, BigInt } from "@graphprotocol/graph-ts"
import {
  AllowListUpdated,
  AllowedFeeRecipientUpdated,
  CreatorPayoutAddressUpdated,
  DropURIUpdated,
  PayerUpdated,
  PublicDropUpdated,
  SeaDropMint,
  SignedMintValidationParamsUpdated,
  TokenGatedDropStageUpdated
} from "../generated/ShibaDrop/ShibaDrop"

export function createAllowListUpdatedEvent(
  nftContract: Address,
  previousMerkleRoot: Bytes,
  newMerkleRoot: Bytes,
  publicKeyURI: Array<string>,
  allowListURI: string
): AllowListUpdated {
  let allowListUpdatedEvent = changetype<AllowListUpdated>(newMockEvent())

  allowListUpdatedEvent.parameters = new Array()

  allowListUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
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
  nftContract: Address,
  feeRecipient: Address,
  allowed: boolean
): AllowedFeeRecipientUpdated {
  let allowedFeeRecipientUpdatedEvent = changetype<AllowedFeeRecipientUpdated>(
    newMockEvent()
  )

  allowedFeeRecipientUpdatedEvent.parameters = new Array()

  allowedFeeRecipientUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
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

export function createCreatorPayoutAddressUpdatedEvent(
  nftContract: Address,
  newPayoutAddress: Address
): CreatorPayoutAddressUpdated {
  let creatorPayoutAddressUpdatedEvent =
    changetype<CreatorPayoutAddressUpdated>(newMockEvent())

  creatorPayoutAddressUpdatedEvent.parameters = new Array()

  creatorPayoutAddressUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
  creatorPayoutAddressUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "newPayoutAddress",
      ethereum.Value.fromAddress(newPayoutAddress)
    )
  )

  return creatorPayoutAddressUpdatedEvent
}

export function createDropURIUpdatedEvent(
  nftContract: Address,
  newDropURI: string
): DropURIUpdated {
  let dropUriUpdatedEvent = changetype<DropURIUpdated>(newMockEvent())

  dropUriUpdatedEvent.parameters = new Array()

  dropUriUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
  dropUriUpdatedEvent.parameters.push(
    new ethereum.EventParam("newDropURI", ethereum.Value.fromString(newDropURI))
  )

  return dropUriUpdatedEvent
}

export function createPayerUpdatedEvent(
  nftContract: Address,
  payer: Address,
  allowed: boolean
): PayerUpdated {
  let payerUpdatedEvent = changetype<PayerUpdated>(newMockEvent())

  payerUpdatedEvent.parameters = new Array()

  payerUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
  payerUpdatedEvent.parameters.push(
    new ethereum.EventParam("payer", ethereum.Value.fromAddress(payer))
  )
  payerUpdatedEvent.parameters.push(
    new ethereum.EventParam("allowed", ethereum.Value.fromBoolean(allowed))
  )

  return payerUpdatedEvent
}

export function createPublicDropUpdatedEvent(
  nftContract: Address,
  publicDrop: ethereum.Tuple
): PublicDropUpdated {
  let publicDropUpdatedEvent = changetype<PublicDropUpdated>(newMockEvent())

  publicDropUpdatedEvent.parameters = new Array()

  publicDropUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
  publicDropUpdatedEvent.parameters.push(
    new ethereum.EventParam("publicDrop", ethereum.Value.fromTuple(publicDrop))
  )

  return publicDropUpdatedEvent
}

export function createSeaDropMintEvent(
  nftContract: Address,
  minter: Address,
  feeRecipient: Address,
  payer: Address,
  quantityMinted: BigInt,
  unitMintPrice: BigInt,
  feeBps: BigInt,
  dropStageIndex: BigInt
): SeaDropMint {
  let seaDropMintEvent = changetype<SeaDropMint>(newMockEvent())

  seaDropMintEvent.parameters = new Array()

  seaDropMintEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
  seaDropMintEvent.parameters.push(
    new ethereum.EventParam("minter", ethereum.Value.fromAddress(minter))
  )
  seaDropMintEvent.parameters.push(
    new ethereum.EventParam(
      "feeRecipient",
      ethereum.Value.fromAddress(feeRecipient)
    )
  )
  seaDropMintEvent.parameters.push(
    new ethereum.EventParam("payer", ethereum.Value.fromAddress(payer))
  )
  seaDropMintEvent.parameters.push(
    new ethereum.EventParam(
      "quantityMinted",
      ethereum.Value.fromUnsignedBigInt(quantityMinted)
    )
  )
  seaDropMintEvent.parameters.push(
    new ethereum.EventParam(
      "unitMintPrice",
      ethereum.Value.fromUnsignedBigInt(unitMintPrice)
    )
  )
  seaDropMintEvent.parameters.push(
    new ethereum.EventParam("feeBps", ethereum.Value.fromUnsignedBigInt(feeBps))
  )
  seaDropMintEvent.parameters.push(
    new ethereum.EventParam(
      "dropStageIndex",
      ethereum.Value.fromUnsignedBigInt(dropStageIndex)
    )
  )

  return seaDropMintEvent
}

export function createSignedMintValidationParamsUpdatedEvent(
  nftContract: Address,
  signer: Address,
  signedMintValidationParams: ethereum.Tuple
): SignedMintValidationParamsUpdated {
  let signedMintValidationParamsUpdatedEvent =
    changetype<SignedMintValidationParamsUpdated>(newMockEvent())

  signedMintValidationParamsUpdatedEvent.parameters = new Array()

  signedMintValidationParamsUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
  signedMintValidationParamsUpdatedEvent.parameters.push(
    new ethereum.EventParam("signer", ethereum.Value.fromAddress(signer))
  )
  signedMintValidationParamsUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "signedMintValidationParams",
      ethereum.Value.fromTuple(signedMintValidationParams)
    )
  )

  return signedMintValidationParamsUpdatedEvent
}

export function createTokenGatedDropStageUpdatedEvent(
  nftContract: Address,
  allowedNftToken: Address,
  dropStage: ethereum.Tuple
): TokenGatedDropStageUpdated {
  let tokenGatedDropStageUpdatedEvent = changetype<TokenGatedDropStageUpdated>(
    newMockEvent()
  )

  tokenGatedDropStageUpdatedEvent.parameters = new Array()

  tokenGatedDropStageUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "nftContract",
      ethereum.Value.fromAddress(nftContract)
    )
  )
  tokenGatedDropStageUpdatedEvent.parameters.push(
    new ethereum.EventParam(
      "allowedNftToken",
      ethereum.Value.fromAddress(allowedNftToken)
    )
  )
  tokenGatedDropStageUpdatedEvent.parameters.push(
    new ethereum.EventParam("dropStage", ethereum.Value.fromTuple(dropStage))
  )

  return tokenGatedDropStageUpdatedEvent
}
