async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);
  const shibaPort = "0x78157C5Ca2e024D429A6b01E21caf542064a8De8"; // It's an EOA, later on it will be replaced via ShibaPort contract

  const ERC1155ShibaDropCloneFactory = await ethers.getContractFactory(
    "ERC1155ShibaDropCloneFactory"
  );
  const contract = await ERC1155ShibaDropCloneFactory.deploy(shibaPort);
  console.log(
    "ERC1155ShibaDropCloneFactory contract deployed at:",
    contract.address
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
