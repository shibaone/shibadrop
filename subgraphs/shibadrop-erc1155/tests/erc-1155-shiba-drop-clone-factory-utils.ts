import { newMockEvent } from "matchstick-as"
import { ethereum, Address } from "@graphprotocol/graph-ts"
import { NewInstance1155 } from "../generated/ERC1155ShibaDropCloneFactory/ERC1155ShibaDropCloneFactory"

export function createNewInstance1155Event(
  instance: Address,
  creator: Address
): NewInstance1155 {
  let newInstance1155Event = changetype<NewInstance1155>(newMockEvent())

  newInstance1155Event.parameters = new Array()

  newInstance1155Event.parameters.push(
    new ethereum.EventParam("instance", ethereum.Value.fromAddress(instance))
  )
  newInstance1155Event.parameters.push(
    new ethereum.EventParam("creator", ethereum.Value.fromAddress(creator))
  )

  return newInstance1155Event
}
