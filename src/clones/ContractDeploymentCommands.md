To deploy ShibaDrop
forge create --rpc-url "http://127.0.0.1:8545" src/ShibaDrop.sol:ShibaDrop --private-key 0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e

To deploy ERC721ShibaDropCloneFactory
forge create --rpc-url "http://127.0.0.1:8545" src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --private-key 0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e

To verify contracts:
forge verify-contract `contractDeployedAddress` `contractPath` --etherscan-api-key `etherscan-api-key` --chain-id `chainid`

forge verify-contract 0x4a5E9F41d59DbEb6CA907A148203B13a5Ce12a85 src/ShibaDrop.sol:ShibaDrop --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
forge verify-contract 0xBAD02aDd4B8a4AD3D7a2B60c98FAAd5167903121 src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
forge verify-contract 0x497013CB37fcD9aB84b5507466f015Ddcda9d9AA src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111

# ERC1155ShibaDropCloneFactory Deployment on Sepolia

forge create --rpc-url "https://sepolia.infura.io/v3/c0cd02423a514c3ea519a59a9b9da3ed" src/clones/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory --constructor-args "0xf518CcaC8Adf316b99ca226FEC4359fAc56db5C6" --private-key 0x7a63fc977f84735581218acbca316fd5955116538249da3164be051935a4d53e --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --verify

## Contracts Deployment Approach on EVM compatible networks

1. Deploy DelegationRegistry

```
forge create --rpc-url "http://127.0.0.1:8545" src/lib/DelegationRegistry.sol:DelegationRegistry --private-key 0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e
```

2. Use the deployed address of DelegationRegistry in ERC1155ShibaDropContractOffererImplementation.sol#L53

```
 IDelegationRegistry public constant DELEGATION_REGISTRY =
        IDelegationRegistry(0x00000000000076A84feF008CDAbe6409d2FE638B); // Change this value
```

3. Deploy ShibaDrop

```
forge create --rpc-url "http://127.0.0.1:8545" src/ShibaDrop.sol:ShibaDrop --private-key 0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e
```

4. Use the deployed address of ShibaDrop in ERC721ShibaDropCloneFactory.sol#L11

```
 address public constant DEFAULT_SHIBADROP =
        0x4a5E9F41d59DbEb6CA907A148203B13a5Ce12a85; // Change this value
```

5. Deploy Conduit

```
forge create --rpc-url "http://127.0.0.1:8545" src/lib/Conduit.sol:Conduit --private-key 0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e
```

6. Use the deployed address of Conduit in ERC721AConduitPreapproved#L13, ERC721AConduitPreapprovedCloneable#L13, ERC1155ConduitPreapproved#L13, ERC721AConduitPreapprovedUpgradeable#L12

```
address internal constant _CONDUIT = 0x1E0049783F008A0085193E00003D00cd54003c71; // Change this value
```

7. Deploy ERC721ShibaDropCloneFactory

```
forge create --rpc-url "http://127.0.0.1:8545" src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --private-key 0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e
```

8. Deploy ERC1155ShibaDropCloneFactory

```
forge create --rpc-url "https://sepolia.infura.io/v3/c0cd02423a514c3ea519a59a9b9da3ed" src/clones/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory --constructor-args "0xf518CcaC8Adf316b99ca226FEC4359fAc56db5C6" --private-key 0x7a63fc977f84735581218acbca316fd5955116538249da3164be051935a4d53e --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --verify
```

Note:

- Change rpc-url & private-key depending on the network that you are trying to deploy the contracts.

## SNS DEPLOYMENT COMMANDS

1. iamdoraemon@MacBook-Pro shibadrop % forge create --rpc-url "https://sepolia.infura.io/v3/c0cd02423a514c3ea519a59a9b9da3ed" src/SNS/Price.sol:Price --private-key 0x7a63fc977f84735581218acbca316fd5955116538249da3164be051935a4d53e --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --verify
   [⠢] Compiling...
   No files changed, compilation skipped
   Deployer: 0x7f9f8D17Bcc2924491E88ada12363C9fe97f17e6
   Deployed to: 0x800af4672aAc528EcAC50Eb907c887F8cf89D3A5
   Transaction hash: 0x665090672b044a984f6883270441b8e46c8593fb1d6656fb0c294274920cb13e
   Starting contract verification...
   Waiting for etherscan to detect contract deployment...
   Start verifying contract `0x800af4672aAc528EcAC50Eb907c887F8cf89D3A5` deployed on sepolia

Contract [src/SNS/Price.sol:Price] "0x800af4672aAc528EcAC50Eb907c887F8cf89D3A5" is already verified. Skipping verification.
iamdoraemon@MacBook-Pro shibadrop % forge verify-contract 0x800af4672aAc528EcAC50Eb907c887F8cf89D3A5 src/SNS/Price.sol:Price --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
Start verifying contract `0x800af4672aAc528EcAC50Eb907c887F8cf89D3A5` deployed on sepolia

Submitting verification for [src/SNS/Price.sol:Price] 0x800af4672aAc528EcAC50Eb907c887F8cf89D3A5.
Submitted contract for verification:
Response: `OK`
GUID: `bauwurk7knapbq9iv2rnugffcsvxgek4ccgvbk2jjh1m8b2qqu`
URL: https://sepolia.etherscan.io/address/0x800af4672aac528ecac50eb907c887f8cf89d3a5

2. iamdoraemon@MacBook-Pro shibadrop % forge verify-check bauwurk7knapbq9iv2rnugffcsvxgek4ccgvbk2jjh1m8b2qqu --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
   Checking verification status on sepolia
   Contract verification status:
   Response: `OK`
   Details: `Pass - Verified`
   Contract successfully verified

3. iamdoraemon@MacBook-Pro shibadrop % forge create --rpc-url "https://sepolia.infura.io/v3/c0cd02423a514c3ea519a59a9b9da3ed" src/SNS/SNS.sol:SNS --constructor-args "https://shib.mypinata.cloud/ipfs/" "0x800af4672aAc528EcAC50Eb907c887F8cf89D3A5" "0xf518CcaC8Adf316b99ca226FEC4359fAc56db5C6" --private-key 0x7a63fc977f84735581218acbca316fd5955116538249da3164be051935a4d53e --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --verify
   [⠢] Compiling...
   No files changed, compilation skipped
   Deployer: 0x7f9f8D17Bcc2924491E88ada12363C9fe97f17e6
   Deployed to: 0x1893790D74fB80E8533aC727742EdDc477EE34F6
   Transaction hash: 0x2e5bd86be056e176f247a52ea190b7913690dc3b7a71d4289610576cc927e066
   Starting contract verification...
   Waiting for etherscan to detect contract deployment...
   Start verifying contract `0x1893790D74fB80E8533aC727742EdDc477EE34F6` deployed on sepolia

Contract [src/SNS/SNS.sol:SNS] "0x1893790D74fB80E8533aC727742EdDc477EE34F6" is already verified. Skipping verification.

4. iamdoraemon@MacBook-Pro shibadrop % forge verify-contract 0x1893790D74fB80E8533aC727742EdDc477EE34F6 src/SNS/SNS.sol:SNS --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
   Start verifying contract `0x1893790D74fB80E8533aC727742EdDc477EE34F6` deployed on sepolia

Submitting verification for [src/SNS/SNS.sol:SNS] 0x1893790D74fB80E8533aC727742EdDc477EE34F6.
Submitted contract for verification:
Response: `OK`
GUID: `zbk2yzz8ci15ds3tjeeqpme3ysmazkyjyhleyiktuiqdy4hbeb`
URL: https://sepolia.etherscan.io/address/0x1893790d74fb80e8533ac727742eddc477ee34f6

5. iamdoraemon@MacBook-Pro shibadrop % forge verify-check zbk2yzz8ci15ds3tjeeqpme3ysmazkyjyhleyiktuiqdy4hbeb --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
   Checking verification status on sepolia
   Contract verification status:
   Response: `NOTOK`
   Details: `Fail - Unable to verify. Please check if the correct constructor argument was entered.`
   Contract failed to verify.
   iamdoraemon@MacBook-Pro shibadrop % forge verify-contract 0x1893790D74fB80E8533aC727742EdDc477EE34F6 src/SNS/SNS.sol:SNS --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111 --constructor-args 0x0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000800af4672aac528ecac50eb907c887f8cf89d3a5000000000000000000000000f518ccac8adf316b99ca226fec4359fac56db5c6000000000000000000000000000000000000000000000000000000000000002068747470733a2f2f736869622e6d7970696e6174612e636c6f75642f69706673
   Start verifying contract `0x1893790D74fB80E8533aC727742EdDc477EE34F6` deployed on sepolia

Submitting verification for [src/SNS/SNS.sol:SNS] 0x1893790D74fB80E8533aC727742EdDc477EE34F6.
Submitted contract for verification:
Response: `OK`
GUID: `tunuyvqdcez5zvabquy5yztlr898pmrwfbiywvcyjik9ycrmp4`
URL: https://sepolia.etherscan.io/address/0x1893790d74fb80e8533ac727742eddc477ee34f6

6. iamdoraemon@MacBook-Pro shibadrop % forge verify-check tunuyvqdcez5zvabquy5yztlr898pmrwfbiywvcyjik9ycrmp4 --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
   Checking verification status on sepolia
   Contract verification status:
   Response: `NOTOK`
   Details: `Fail - Unable to verify. Please check if the correct constructor argument was entered.`
   Contract failed to verify.

7. iamdoraemon@MacBook-Pro shibadrop % forge verify-contract 0x1893790D74fB80E8533aC727742EdDc477EE34F6 src/SNS/SNS.sol:SNS --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111 --constructor-args 0x0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000800af4672aac528ecac50eb907c887f8cf89d3a5000000000000000000000000f518ccac8adf316b99ca226fec4359fac56db5c6000000000000000000000000000000000000000000000000000000000000002168747470733a2f2f736869622e6d7970696e6174612e636c6f75642f697066732f00000000000000000000000000000000000000000000000000000000000000
   Start verifying contract `0x1893790D74fB80E8533aC727742EdDc477EE34F6` deployed on sepolia

Submitting verification for [src/SNS/SNS.sol:SNS] 0x1893790D74fB80E8533aC727742EdDc477EE34F6.
Submitted contract for verification:
Response: `OK`
GUID: `6b9vwsjjjg5h8gvimgsvh97nd5vun1rtp7twkhj3b387fg2trx`
URL: https://sepolia.etherscan.io/address/0x1893790d74fb80e8533ac727742eddc477ee34f6

8. iamdoraemon@MacBook-Pro shibadrop % forge verify-check 6b9vwsjjjg5h8gvimgsvh97nd5vun1rtp7twkhj3b387fg2trx --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
   Checking verification status on sepolia
   Contract verification status:
   Response: `OK`
   Details: `Pass - Verified`
   Contract successfully verified
   iamdoraemon@MacBook-Pro shibadrop %
