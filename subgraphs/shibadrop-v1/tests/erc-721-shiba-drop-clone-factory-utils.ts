import { newMockEvent } from "matchstick-as"
import { ethereum, Address } from "@graphprotocol/graph-ts"
import { NewInstance } from "../generated/ERC721ShibaDropCloneFactory/ERC721ShibaDropCloneFactory"

export function createNewInstanceEvent(instance: Address): NewInstance {
  let newInstanceEvent = changetype<NewInstance>(newMockEvent())

  newInstanceEvent.parameters = new Array()

  newInstanceEvent.parameters.push(
    new ethereum.EventParam("instance", ethereum.Value.fromAddress(instance))
  )

  return newInstanceEvent
}
