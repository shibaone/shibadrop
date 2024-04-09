import {
  assert,
  describe,
  test,
  clearStore,
  beforeAll,
  afterAll
} from "matchstick-as/assembly/index"
import { Address, Bytes, BigInt } from "@graphprotocol/graph-ts"
import { AllowListUpdated } from "../generated/schema"
import { AllowListUpdated as AllowListUpdatedEvent } from "../generated/ShibaDrop/ShibaDrop"
import { handleAllowListUpdated } from "../src/shiba-drop"
import { createAllowListUpdatedEvent } from "./shiba-drop-utils"

// Tests structure (matchstick-as >=0.5.0)
// https://thegraph.com/docs/en/developer/matchstick/#tests-structure-0-5-0

describe("Describe entity assertions", () => {
  beforeAll(() => {
    let nftContract = Address.fromString(
      "0x0000000000000000000000000000000000000001"
    )
    let previousMerkleRoot = Bytes.fromI32(1234567890)
    let newMerkleRoot = Bytes.fromI32(1234567890)
    let publicKeyURI = ["Example string value"]
    let allowListURI = "Example string value"
    let newAllowListUpdatedEvent = createAllowListUpdatedEvent(
      nftContract,
      previousMerkleRoot,
      newMerkleRoot,
      publicKeyURI,
      allowListURI
    )
    handleAllowListUpdated(newAllowListUpdatedEvent)
  })

  afterAll(() => {
    clearStore()
  })

  // For more test scenarios, see:
  // https://thegraph.com/docs/en/developer/matchstick/#write-a-unit-test

  test("AllowListUpdated created and stored", () => {
    assert.entityCount("AllowListUpdated", 1)

    // 0xa16081f360e3847006db660bae1c6d1b2e17ec2a is the default address used in newMockEvent() function
    assert.fieldEquals(
      "AllowListUpdated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "nftContract",
      "0x0000000000000000000000000000000000000001"
    )
    assert.fieldEquals(
      "AllowListUpdated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "previousMerkleRoot",
      "1234567890"
    )
    assert.fieldEquals(
      "AllowListUpdated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "newMerkleRoot",
      "1234567890"
    )
    assert.fieldEquals(
      "AllowListUpdated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "publicKeyURI",
      "[Example string value]"
    )
    assert.fieldEquals(
      "AllowListUpdated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "allowListURI",
      "Example string value"
    )

    // More assert options:
    // https://thegraph.com/docs/en/developer/matchstick/#asserts
  })
})
