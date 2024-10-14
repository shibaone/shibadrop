Pre-requisites

1. git clone git@github.com:shibaone/shibadrop.git
2. cd shibadrop
3. git checkout feat/shibarium/deployment
4. npm install && forge install
5. Update private key in .env file `PRIVATE_KEY="YOUR PRIVATE KEY"`
6. npx hardhat compile

7. npx hardhat run hh-scripts/deployDelegationRegistry.js --network shibarium
8. npx hardhat --network shibarium verify --contract src/lib/DelegationRegistry.sol:DelegationRegistry "CONTRACT_DEPLOYED_ADDRESS"
9. Use the deployed address of DelegationRegistry in ERC1155ShibaDropContractOffererImplementation.sol#L53

10. npx hardhat run hh-scripts/deployShibaDrop.js --network shibarium
11. npx hardhat --network shibarium verify --contract src/ShibaDrop.sol:ShibaDrop "CONTRACT_DEPLOYED_ADDRESS"
12. Use the deployed address of ShibaDrop in ERC721ShibaDropCloneFactory.sol#L11

13. npx hardhat run hh-scripts/deployConduit.js --network shibarium
14. npx hardhat --network shibarium verify --contract src/lib/Conduit.sol:Conduit "CONTRACT_DEPLOYED_ADDRESS"
15. Use the deployed address of Conduit in ERC721AConduitPreapproved.sol#L13, ERC721AConduitPreapprovedCloneable.sol#L13, ERC1155ConduitPreapproved.sol#L13, ERC721AConduitPreapprovedUpgradeable.sol#L12

16. npx hardhat run hh-scripts/deployERC721ShibaDropCloneFactory.js --network shibarium
17. npx hardhat --network shibarium verify --contract src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory "CONTRACT_DEPLOYED_ADDRESS"

    **17.1** Grab ERC721ShibaDropCloneable implementation address from ShibariumScan, Read Tab
    https://www.shibariumscan.io/address/${CONTRACT_DEPLOYED_ADDRESS}?tab=read_contract

18. npx hardhat --network shibarium verify --contract src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable `ERC721ShibaDropCloneable Implementation Address`

19. Copy EOA Address in `deployERC1155ShibaDropCloneFactory.js#L5 shibaPort =`
20. npx hardhat run hh-scripts/deployERC1155ShibaDropCloneFactory.js --network shibarium
21. npx hardhat --network shibarium verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory "CONTRACT_DEPLOYED_ADDRESS" "CONSTRUCTOR ARG 1"

    **21.1** Grab ERC1155ShibaDropCloneable implementation address from ShibariumScan, Read Tab
    https://www.shibariumscan.io/address/${CONTRACT_DEPLOYED_ADDRESS}?tab=read_contract

    **21.2** Grab ERC1155Configurer address from ShibariumScan, Read Tab
    https://www.shibariumscan.io/address/${CONTRACT_DEPLOYED_ADDRESS}?tab=read_contract

22. npx hardhat --network shibarium verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneable.sol:ERC1155ShibaDropCloneable "CONTRACT_DEPLOYED_ADDRESS"

23. npx hardhat --network shibarium verify --contract src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer "CONTRACT_DEPLOYED_ADDRESS"

---

Pre-requisites

1. git clone git@github.com:shibaone/marketplace-escrow.git
2. cd marketplace-escrow
3. forge clean
4. forge build
5. Update .env with the below required fields

```
ENV FILE marketplace-escrow

export FOUNDRY_PROFILE="default"
export PROXY_ADDRESS="YOUR DEPLOYED PROXY ADDRESS"
export DEPLOYER_ADDRESS="ADDRESS ASSOCIATED WITH THE BELOW PRIVATE KEY"
export PRIVATE_KEY="YOUR PRIVATE KEY"
export ETHERSCAN_API_KEY="abc"
export VERIFIER_URL="https://www.shibariumscan.io/api/"
```

6. forge script script/Deploy.s.sol:Deploy --rpc-url shibarium --broadcast --verifier blockscout --verify --watch -vvvv --ffi
