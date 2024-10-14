async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const ERC721ShibaDropCloneFactory = await ethers.getContractFactory(
    "ERC721ShibaDropCloneFactory"
  );
  const contract = await ERC721ShibaDropCloneFactory.deploy();
  console.log(
    "ERC721ShibaDropCloneFactory contract deployed at:",
    contract.address
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
