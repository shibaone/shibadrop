import { NewInstance1155 as NewInstance1155Event } from "../generated/ERC1155ShibaDropCloneFactory/ERC1155ShibaDropCloneFactory"
import { NewInstance1155 } from "../generated/schema"

export function handleNewInstance1155(event: NewInstance1155Event): void {
  let entity = new NewInstance1155(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  )
  entity.instance = event.params.instance
  entity.creator = event.params.creator

  entity.blockNumber = event.block.number
  entity.blockTimestamp = event.block.timestamp
  entity.transactionHash = event.transaction.hash

  entity.save()
}
