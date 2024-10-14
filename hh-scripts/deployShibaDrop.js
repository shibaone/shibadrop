async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const ShibaDrop = await ethers.getContractFactory("ShibaDrop");
  const contract = await ShibaDrop.deploy();
  console.log("Shibadrop contract deployed at:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
