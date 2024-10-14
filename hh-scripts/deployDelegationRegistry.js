async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const DelegationRegistry = await ethers.getContractFactory(
    "DelegationRegistry"
  );
  const contract = await DelegationRegistry.deploy();

  console.log("DelegationRegistry contract deployed at:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
