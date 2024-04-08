To deploy ShibaDrop
forge create --rpc-url "http://127.0.0.1:8545" src/ShibaDrop.sol:ShibaDrop --private-key 0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e

To deploy ERC721ShibaDropCloneFactory
forge create --rpc-url "http://127.0.0.1:8545" src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --private-key 0xdf57089febbacf7ba0bc227dafbffa9fc08a93fdc68e1e42411a14efcf23656e

To verify contracts:
forge verify-contract `contractDeployedAddress` `contractPath` --etherscan-api-key `etherscan-api-key` --chain-id `chainid`

forge verify-contract 0x4a5E9F41d59DbEb6CA907A148203B13a5Ce12a85 src/ShibaDrop.sol:ShibaDrop --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
forge verify-contract 0xBAD02aDd4B8a4AD3D7a2B60c98FAAd5167903121 src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
forge verify-contract 0x497013CB37fcD9aB84b5507466f015Ddcda9d9AA src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable --etherscan-api-key B6P3FBPPNK83GEX6M24S8IVH3EE2RXTC32 --chain-id 11155111
