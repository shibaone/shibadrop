import { NewInstance as NewInstanceEvent } from "../generated/ERC721ShibaDropCloneFactory/ERC721ShibaDropCloneFactory";
import { ERC721ShibaDropCloneable } from "../generated/templates/ERC721ShibaDropCloneable/ERC721ShibaDropCloneable";
import { NewInstance } from "../generated/schema";
import { ERC721ShibaDropCloneable as CloneableContract } from "../generated/templates";

export function handleNewInstance(event: NewInstanceEvent): void {
  let entity = new NewInstance(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.instance = event.params.instance;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  // To fetch the token name & symbol and store it in the subgraph
  const contract = ERC721ShibaDropCloneable.bind(event.params.instance);
  const name = contract.name();
  const symbol = contract.symbol();
  entity.name = name;
  entity.symbol = symbol;
  entity.creator = event.transaction.from;

  CloneableContract.create(event.params.instance);

  entity.save();
}
