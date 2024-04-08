import {
  assert,
  describe,
  test,
  clearStore,
  beforeAll,
  afterAll
} from "matchstick-as/assembly/index"
import { Address } from "@graphprotocol/graph-ts"
import { NewInstance } from "../generated/schema"
import { NewInstance as NewInstanceEvent } from "../generated/ERC721ShibaDropCloneFactory/ERC721ShibaDropCloneFactory"
import { handleNewInstance } from "../src/erc-721-shiba-drop-clone-factory"
import { createNewInstanceEvent } from "./erc-721-shiba-drop-clone-factory-utils"

// Tests structure (matchstick-as >=0.5.0)
// https://thegraph.com/docs/en/developer/matchstick/#tests-structure-0-5-0

describe("Describe entity assertions", () => {
  beforeAll(() => {
    let instance = Address.fromString(
      "0x0000000000000000000000000000000000000001"
    )
    let newNewInstanceEvent = createNewInstanceEvent(instance)
    handleNewInstance(newNewInstanceEvent)
  })

  afterAll(() => {
    clearStore()
  })

  // For more test scenarios, see:
  // https://thegraph.com/docs/en/developer/matchstick/#write-a-unit-test

  test("NewInstance created and stored", () => {
    assert.entityCount("NewInstance", 1)

    // 0xa16081f360e3847006db660bae1c6d1b2e17ec2a is the default address used in newMockEvent() function
    assert.fieldEquals(
      "NewInstance",
      "0xa16081f360e3847006db660bae1c6d1b2e17ec2a-1",
      "instance",
      "0x0000000000000000000000000000000000000001"
    )

    // More assert options:
    // https://thegraph.com/docs/en/developer/matchstick/#asserts
  })
})
