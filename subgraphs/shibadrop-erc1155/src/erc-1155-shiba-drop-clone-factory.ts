import { ERC1155ShibaDropCloneable } from "../generated/ERC1155ShibaDropCloneable/ERC1155ShibaDropCloneable";
import { ERC1155ShibaDropCloneable as CloneableContract } from "../generated/templates";
import { NewInstance1155 as NewInstance1155Event } from "../generated/ERC1155ShibaDropCloneFactory/ERC1155ShibaDropCloneFactory";
import { NewInstance1155 } from "../generated/schema";

export function handleNewInstance1155(event: NewInstance1155Event): void {
  let entity = new NewInstance1155(
    event.transaction.hash.concatI32(event.logIndex.toI32())
  );
  entity.instance = event.params.instance;
  entity.creator = event.params.creator;

  entity.blockNumber = event.block.number;
  entity.blockTimestamp = event.block.timestamp;
  entity.transactionHash = event.transaction.hash;

  // To fetch the token name & symbol and store it in the subgraph
  const contract = ERC1155ShibaDropCloneable.bind(event.params.instance);
  const name = contract.name();
  const symbol = contract.symbol();
  entity.name = name;
  entity.symbol = symbol;
  entity.type = "Proxy";
  entity.standard = "erc1155";

  CloneableContract.create(event.params.instance);

  entity.save();
}
