import {
  assert,
  describe,
  test,
  clearStore,
  beforeAll,
  afterAll
} from "matchstick-as/assembly/index"
import { Address, BigInt, Bytes } from "@graphprotocol/graph-ts"
import { AllowedShibaDropUpdated } from "../generated/schema"
import { AllowedShibaDropUpdated as AllowedShibaDropUpdatedEvent } from "../generated/ERC721ShibaDropCloneable/ERC721ShibaDropCloneable"
import { handleAllowedShibaDropUpdated } from "../src/erc-721-shiba-drop-cloneable"
import { createAllowedShibaDropUpdatedEvent } from "./erc-721-shiba-drop-cloneable-utils"

// Tests structure (matchstick-as >=0.5.0)
// https://thegraph.com/docs/en/developer/matchstick/#tests-structure-0-5-0

describe("Describe entity assertions", () => {
  beforeAll(() => {
    let allowedShibaDrop = [
      Address.fromString("0x0000000000000000000000000000000000000001")
    ]
    let newAllowedShibaDropUpdatedEvent =
      createAllowedShibaDropUpdatedEvent(allowedShibaDrop)
    handleAllowedShibaDropUpdated(newAllowedShibaDropUpdatedEvent)
  })

  afterAll(() => {
    clearStore()
  })

  // For more test scenarios, see:
  // https://thegraph.com/docs/en/developer/matchstick/#write-a-unit-test

  test("AllowedShibaDropUpdated created and stored", () => {
    assert.entityCount("AllowedShibaDropUpdated", 1)

    // 0xa16081f360e3847006db660bae1c6d1b2e17ec2a is the default address used in newMockEvent() function
    assert.fieldEquals(
      "AllowedShibaDropUpdated",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "allowedShibaDrop",
      "[0x0000000000000000000000000000000000000001]"
    )

    // More assert options:
    // https://thegraph.com/docs/en/developer/matchstick/#asserts
  })
})
