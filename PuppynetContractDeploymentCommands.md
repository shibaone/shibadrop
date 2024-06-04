To deploy ShibaDrop
forge create --rpc-url "https://puppynet.shibrpc.com/" src/ShibaDrop.sol:ShibaDrop --private-key 0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d

To deploy ERC721ShibaDropCloneFactory
forge create --rpc-url "https://puppynet.shibrpc.com/" src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --private-key 0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d

To verify contracts:
forge verify-contract `contractDeployedAddress` `contractPath` --etherscan-api-key `etherscan-api-key` --chain-id `chainid`

forge verify-contract 0x4a5E9F41d59DbEb6CA907A148203B13a5Ce12a85 src/ShibaDrop.sol:ShibaDrop --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 11155111
forge verify-contract 0xBAD02aDd4B8a4AD3D7a2B60c98FAAd5167903121 src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 11155111
forge verify-contract 0x497013CB37fcD9aB84b5507466f015Ddcda9d9AA src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 11155111

## Contracts Deployment Approach on EVM compatible networks

1. Deploy DelegationRegistry

```
USING FOUNDRY:

forge create --rpc-url "https://puppynet.shibrpc.com/" src/lib/DelegationRegistry.sol:DelegationRegistry --private-key 0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d

forge verify-contract "CONTRACT_DEPLOYED_ADDRESS" src/lib/DelegationRegistry.sol:DelegationRegistry --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify --verifier "blockscout" --chain-id 157

forge verify-check "GUID" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 157 --verifier "blockscout"

-----------------------------------------------

USING HARDHAT:

npx hardhat run hh-scripts/deployDelegationRegistry.js --network puppynet

npx hardhat --network puppynet verify --contract src/lib/DelegationRegistry.sol:DelegationRegistry "CONTRACT_DEPLOYED_ADDRESS"
```

2. Use the deployed address of DelegationRegistry in ERC1155ShibaDropContractOffererImplementation.sol#L53

```
 IDelegationRegistry public constant DELEGATION_REGISTRY =
        IDelegationRegistry(0x00000000000076A84feF008CDAbe6409d2FE638B); // Change this value
```

3. Deploy ShibaDrop

```
forge create --rpc-url "https://puppynet.shibrpc.com/" src/ShibaDrop.sol:ShibaDrop --private-key 0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d

forge verify-contract "CONTRACT_DEPLOYED_ADDRESS" src/ShibaDrop.sol:ShibaDrop --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify --verifier "blockscout" --chain-id 157

forge verify-check "GUID" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 157 --verifier "blockscout"

-----------------------------------------------

USING HARDHAT:

npx hardhat run hh-scripts/deployShibaDrop.js --network puppynet

npx hardhat --network puppynet verify --contract src/ShibaDrop.sol:ShibaDrop "CONTRACT_DEPLOYED_ADDRESS"
```

4. Use the deployed address of ShibaDrop in ERC721ShibaDropCloneFactory.sol#L11

```
 address public constant DEFAULT_SHIBADROP =
        0x4a5E9F41d59DbEb6CA907A148203B13a5Ce12a85; // Change this value
```

5. Deploy Conduit

```
forge create --rpc-url "https://puppynet.shibrpc.com/" src/lib/Conduit.sol:Conduit --private-key 0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d

forge verify-contract "CONTRACT_DEPLOYED_ADDRESS" src/lib/Conduit.sol:Conduit --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify --verifier "blockscout" --chain-id 157

forge verify-check "GUID" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 157 --verifier "blockscout"
-----------------------------------------------

USING HARDHAT:

npx hardhat run hh-scripts/deployConduit.js --network puppynet

npx hardhat --network puppynet verify --contract src/lib/Conduit.sol:Conduit "CONTRACT_DEPLOYED_ADDRESS"
```

6. Use the deployed address of Conduit in ERC721AConduitPreapproved#L13, ERC721AConduitPreapprovedCloneable#L13, ERC1155ConduitPreapproved#L13, ERC721AConduitPreapprovedUpgradeable#L12

```
address internal constant _CONDUIT = 0x1E0049783F008A0085193E00003D00cd54003c71; // Change this value
```

7. Deploy ERC721ShibaDropCloneFactory

```
forge create --rpc-url "https://puppynet.shibrpc.com/" src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --private-key 0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d

forge verify-contract "CONTRACT_DEPLOYED_ADDRESS" src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify --verifier "blockscout" --chain-id 157

forge verify-check "GUID" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 157 --verifier "blockscout"
-----------------------------------------------

USING HARDHAT:

npx hardhat run hh-scripts/deployERC721ShibaDropCloneFactory.js --network puppynet

npx hardhat --network puppynet verify --contract src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory "CONTRACT_DEPLOYED_ADDRESS"


Verify ERC721ShibaDropCloneable contract

npx hardhat --network puppynet verify --contract src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable "CONTRACT_DEPLOYED_ADDRESS"
```

8. Deploy ERC1155ShibaDropCloneFactory

```
forge create --rpc-url "https://puppynet.shibrpc.com/" src/clones/ERC1155/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory --constructor-args "0x78157C5Ca2e024D429A6b01E21caf542064a8De8" --private-key "0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify --verifier "blockscout"

forge verify-contract "CONTRACT_DEPLOYED_ADDRESS" src/clones/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify --verifier "blockscout" --chain-id 157

forge verify-check "GUID" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 157 --verifier "blockscout"
-----------------------------------------------

USING HARDHAT:

npx hardhat run hh-scripts/deployERC1155ShibaDropCloneFactory.js --network puppynet

npx hardhat --network puppynet verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory "CONTRACT_DEPLOYED_ADDRESS" "CONSTRUCTOR ARG 1"

Verify ERC1155ShibaDropCloneable contract

npx hardhat --network puppynet verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneable.sol:ERC1155ShibaDropCloneable "CONTRACT_DEPLOYED_ADDRESS"

Verify ERC1155ShibaDropConfigurer contract

npx hardhat --network puppynet verify --contract src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer "CONTRACT_DEPLOYED_ADDRESS"
```

9. Deploy Marketplace contract

```
cd marketplace-escrow
forge clean
forge build
Update .env with the required fields
forge script script/Deploy.s.sol:Deploy --rpc-url puppynet --broadcast --verifier blockscout --verify --watch -vvvv --ffi
```

10. Deploy Subgraph

```
cd marketplace-escrow-subgraph
yarn install
Change contract address & startBlock in puppynet_subgraph.yaml file
yarn run codegen-puppynet
yarn run build-puppynet
yarn run deploy-puppynet
```

Note:

- Change rpc-url & private-key depending on the network that you are trying to deploy the contracts.

## SNS DEPLOYMENT COMMANDS

1. forge create --rpc-url "https://puppynet.shibrpc.com/" src/SNS/Price.sol:Price --private-key "0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify

   - forge verify-contract "CONTRACT_DEPLOYED_ADDRESS" src/SNS/Price.sol:Price --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify --verifier "blockscout" --chain-id 157
   - forge verify-check "GUID" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 157 --verifier "blockscout"

2. forge create --rpc-url "https://puppynet.shibrpc.com/" src/SNS/SNS.sol:SNS --constructor-args "https://shib.mypinata.cloud/ipfs/" "0x800af4672aAc528EcAC50Eb907c887F8cf89D3A5" "0xf518CcaC8Adf316b99ca226FEC4359fAc56db5C6" --private-key "0x1e6507068630d4b923c20675063df9b679f9bee5c2ca3a3ebfc53fc3076fe24d" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify

   - Constructor arguments are: 1. Price Contract Address, 2. TokenURI Address
   - forge verify-contract "CONTRACT_DEPLOYED_ADDRESS" src/SNS/SNS.sol:SNS --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --verify --verifier "blockscout" --chain-id 157
   - forge verify-check "GUID" --etherscan-api-key "7f80a939-7973-4249-a064-3f355244b930" --chain-id 157 --verifier "blockscout"
