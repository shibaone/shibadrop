import { NewInstance as NewInstanceEvent } from "../generated/ERC721ShibaDropCloneFactory/ERC721ShibaDropCloneFactory"
import { NewInstance } from "../generated/schema"

export function handleNewInstance(event: NewInstanceEvent): void {
  let entity = new NewInstance(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.instance = event.params.instance

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}
