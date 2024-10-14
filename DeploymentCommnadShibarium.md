iamdoraemon@MacBook-Pro shibasea %
iamdoraemon@MacBook-Pro shibasea % cd ../shibadrop
iamdoraemon@MacBook-Pro shibadrop % npx hardhat run hh-scripts/deployDelegationRegistry.js --network shibarium
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Compiled 83 Solidity files successfully (evm target: paris).
TypeError: Invalid URL
at new URL (node:internal/url:775:36)
at new HttpProvider (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/hardhat/src/internal/core/providers/http.ts:54:17)
at createProvider (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/hardhat/src/internal/core/providers/construction.ts:130:23)
at LazyInitializationProviderAdapter.\_providerFactory (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/hardhat/src/internal/core/runtime-environment.ts:104:28)
at LazyInitializationProviderAdapter.init (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/hardhat/src/internal/core/providers/lazy-initialization.ts:40:42)
at LazyInitializationProviderAdapter.\_getOrInitProvider (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/hardhat/src/internal/core/providers/lazy-initialization.ts:160:34)
at LazyInitializationProviderAdapter.send (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/hardhat/src/internal/core/providers/lazy-initialization.ts:55:33)
at EthersProviderWrapper.send (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:48)
at EthersProviderWrapper.JsonRpcProvider.listAccounts (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/@ethersproject/providers/src.ts/json-rpc-provider.ts:499:21)
at getSigners (/Users/iamdoraemon/Desktop/github.com/shibaone/shibadrop/node_modules/@nomiclabs/hardhat-ethers/src/internal/helpers.ts:45:46) {
code: 'ERR_INVALID_URL',
input: '=https://www.shibrpc.com'
}
iamdoraemon@MacBook-Pro shibadrop % npx hardhat run hh-scripts/deployDelegationRegistry.js --network shibarium
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Compiled 83 Solidity files successfully (evm target: paris).
Deploying contracts with the account: 0x63d596e6b6399bbb3cFA3075968946b870045955
DelegationRegistry contract deployed at: 0x6fcceD73dDaF1a3455E6c951e9d7a0ABcBD115d6
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/lib/DelegationRegistry.sol:DelegationRegistry 0x6fcceD73dDaF1a3455E6c951e9d7a0ABcBD115d6
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/lib/DelegationRegistry.sol:DelegationRegistry at 0x6fcceD73dDaF1a3455E6c951e9d7a0ABcBD115d6
for verification on the block explorer. Waiting for verification result...

Successfully verified contract DelegationRegistry on Etherscan.
https://www.shibariumscan.io/address/0x6fcceD73dDaF1a3455E6c951e9d7a0ABcBD115d6#code
iamdoraemon@MacBook-Pro shibadrop % npx hardhat run hh-scripts/deployShibaDrop.js --network shibarium
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Compiled 83 Solidity files successfully (evm target: paris).
Deploying contracts with the account: 0x63d596e6b6399bbb3cFA3075968946b870045955
Shibadrop contract deployed at: 0x02a9Fe09435ade5105E7cc0C8640CabF44C8f0Dc
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/ShibaDrop.sol:ShibaDrop 0x02a9Fe09435ade5105E7cc0C8640CabF44C8f0Dc
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/ShibaDrop.sol:ShibaDrop at 0x02a9Fe09435ade5105E7cc0C8640CabF44C8f0Dc
for verification on the block explorer. Waiting for verification result...

Successfully verified contract ShibaDrop on Etherscan.
https://www.shibariumscan.io/address/0x02a9Fe09435ade5105E7cc0C8640CabF44C8f0Dc#code
iamdoraemon@MacBook-Pro shibadrop % npx hardhat run hh-scripts/deployConduit.js --network shibarium
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Compiled 83 Solidity files successfully (evm target: paris).
Deploying contracts with the account: 0x63d596e6b6399bbb3cFA3075968946b870045955
Conduit contract deployed at: 0xf981c35f969A16831D2C55FEbcAac75c1B45dec3
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/lib/Conduit.sol:Conduit 0xf981c35f969A16831D2C55FEbcAac75c1B45dec3
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/lib/Conduit.sol:Conduit at 0xf981c35f969A16831D2C55FEbcAac75c1B45dec3
for verification on the block explorer. Waiting for verification result...

Successfully verified contract Conduit on Etherscan.
https://www.shibariumscan.io/address/0xf981c35f969A16831D2C55FEbcAac75c1B45dec3#code
iamdoraemon@MacBook-Pro shibadrop % npx hardhat run hh-scripts/deployERC721ShibaDropCloneFactory.js --network shibarium
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Compiled 83 Solidity files successfully (evm target: paris).
Deploying contracts with the account: 0x63d596e6b6399bbb3cFA3075968946b870045955
ERC721ShibaDropCloneFactory contract deployed at: 0xff48DB6307e6590Da0Add253B3256100ec606618
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory 0xff48DB6307e6590Da0Add253B3256100ec606618
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/clones/ERC721ShibaDropCloneFactory.sol:ERC721ShibaDropCloneFactory at 0xff48DB6307e6590Da0Add253B3256100ec606618
for verification on the block explorer. Waiting for verification result...

Successfully verified contract ERC721ShibaDropCloneFactory on Etherscan.
https://www.shibariumscan.io/address/0xff48DB6307e6590Da0Add253B3256100ec606618#code
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable 0x98d6dA72E2Fc164e07Ef82E70249AF92b304b32a
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable at 0x98d6dA72E2Fc164e07Ef82E70249AF92b304b32a
for verification on the block explorer. Waiting for verification result...

^C
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable 0x98d6dA72E2Fc164e07Ef82E70249AF92b304b32a
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/clones/ERC721ShibaDropCloneable.sol:ERC721ShibaDropCloneable at 0x98d6dA72E2Fc164e07Ef82E70249AF92b304b32a
for verification on the block explorer. Waiting for verification result...

Successfully verified contract ERC721ShibaDropCloneable on Etherscan.
https://www.shibariumscan.io/address/0x98d6dA72E2Fc164e07Ef82E70249AF92b304b32a#code
iamdoraemon@MacBook-Pro shibadrop % npx hardhat run hh-scripts/deployERC1155ShibaDropCloneFactory.js --network shibarium
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Compiled 83 Solidity files successfully (evm target: paris).
Deploying contracts with the account: 0x63d596e6b6399bbb3cFA3075968946b870045955
ERC1155ShibaDropCloneFactory contract deployed at: 0x8f001E4792F50324430Be656C256BFF63A7a8B27
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory 0x8f001E4792F50324430Be656C256BFF63A7a8B27 0x78157C5Ca2e024D429A6b01E21caf542064a8De8
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/clones/ERC1155/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory at 0x8f001E4792F50324430Be656C256BFF63A7a8B27
for verification on the block explorer. Waiting for verification result...

Successfully verified contract ERC1155ShibaDropCloneFactory on Etherscan.
https://www.shibariumscan.io/address/0x8f001E4792F50324430Be656C256BFF63A7a8B27#code
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneable.sol:ERC1155ShibaDropCloneable 0xdE14b6080d6659dc9B122F71B3378Aa7a530f9b3
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/clones/ERC1155/ERC1155ShibaDropCloneable.sol:ERC1155ShibaDropCloneable at 0xdE14b6080d6659dc9B122F71B3378Aa7a530f9b3
for verification on the block explorer. Waiting for verification result...

^C
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneable.sol:ERC1155ShibaDropCloneable 0xdE14b6080d6659dc9B122F71B3378Aa7a530f9b3
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/clones/ERC1155/ERC1155ShibaDropCloneable.sol:ERC1155ShibaDropCloneable at 0xdE14b6080d6659dc9B122F71B3378Aa7a530f9b3
for verification on the block explorer. Waiting for verification result...

Successfully verified contract ERC1155ShibaDropCloneable on Etherscan.
https://www.shibariumscan.io/address/0xdE14b6080d6659dc9B122F71B3378Aa7a530f9b3#code
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer 0xdFdA403077F58dA765baA5A9a1dEFe2906C25Ddf
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer at 0xdFdA403077F58dA765baA5A9a1dEFe2906C25Ddf
for verification on the block explorer. Waiting for verification result...

We tried verifying your contract ERC1155ShibaDropConfigurer without including any unrelated one, but it failed.
Trying again with the full solc input used to compile and deploy it.
This means that unrelated contracts may be displayed on Etherscan...

Successfully submitted source code for contract
src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer at 0xdFdA403077F58dA765baA5A9a1dEFe2906C25Ddf
for verification on the block explorer. Waiting for verification result...

DEPRECATION WARNING: 'hardhat-etherscan' has been deprecated in favor of 'hardhat-verify'. You can find more information about the migration in the readme.
Error in plugin @nomiclabs/hardhat-etherscan: The contract verification failed.
Reason: Fail - Unable to verify

For more info run Hardhat with --show-stack-traces
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer 0xdFdA403077F58dA765baA5A9a1dEFe2906C25Ddf
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer at 0xdFdA403077F58dA765baA5A9a1dEFe2906C25Ddf
for verification on the block explorer. Waiting for verification result...

We tried verifying your contract ERC1155ShibaDropConfigurer without including any unrelated one, but it failed.
Trying again with the full solc input used to compile and deploy it.
This means that unrelated contracts may be displayed on Etherscan...

Successfully submitted source code for contract
src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer at 0xdFdA403077F58dA765baA5A9a1dEFe2906C25Ddf
for verification on the block explorer. Waiting for verification result...

DEPRECATION WARNING: 'hardhat-etherscan' has been deprecated in favor of 'hardhat-verify'. You can find more information about the migration in the readme.
Error in plugin @nomiclabs/hardhat-etherscan: The contract verification failed.
Reason: Fail - Unable to verify

For more info run Hardhat with --show-stack-traces
iamdoraemon@MacBook-Pro shibadrop % npx hardhat run hh-scripts/deployERC1155ShibaDropCloneFactory.js --network puppynet
^C
iamdoraemon@MacBook-Pro shibadrop % npx hardhat run hh-scripts/deployERC1155ShibaDropCloneFactory.js --network shibarium
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Compiled 83 Solidity files successfully (evm target: paris).
Deploying contracts with the account: 0x63d596e6b6399bbb3cFA3075968946b870045955
ERC1155ShibaDropCloneFactory contract deployed at: 0xb9Cb0B63C7B2114f865bb601C031cDa548B82842
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network puppynet verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory 0xb9Cb0B63C7B2114f865bb601C031cDa548B82842 0x78157C5Ca2e024D429A6b01E21caf542064a8De8
Error in plugin @nomiclabs/hardhat-etherscan: The address 0xb9Cb0B63C7B2114f865bb601C031cDa548B82842 has no bytecode. Is the contract deployed to this network?
The selected network is puppynet.

For more info run Hardhat with --show-stack-traces
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneFactory.sol:ERC1155ShibaDropCloneFactory 0xb9Cb0B63C7B2114f865bb601C031cDa548B82842 0x78157C5Ca2e024D429A6b01E21caf542064a8De8
The contract 0xb9Cb0B63C7B2114f865bb601C031cDa548B82842 has already been verified
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/clones/ERC1155/ERC1155ShibaDropCloneable.sol:ERC1155ShibaDropCloneable 0xBF46847d7105DBa9C8C67E0775219Ffe3410F1d5
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/clones/ERC1155/ERC1155ShibaDropCloneable.sol:ERC1155ShibaDropCloneable at 0xBF46847d7105DBa9C8C67E0775219Ffe3410F1d5
for verification on the block explorer. Waiting for verification result...

Successfully verified contract ERC1155ShibaDropCloneable on Etherscan.
https://www.shibariumscan.io/address/0xBF46847d7105DBa9C8C67E0775219Ffe3410F1d5#code
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer 0x70a48b74f6AA18b108D725eC8f0b853E023ad44c
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer at 0x70a48b74f6AA18b108D725eC8f0b853E023ad44c
for verification on the block explorer. Waiting for verification result...

We tried verifying your contract ERC1155ShibaDropConfigurer without including any unrelated one, but it failed.
Trying again with the full solc input used to compile and deploy it.
This means that unrelated contracts may be displayed on Etherscan...

Successfully submitted source code for contract
src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer at 0x70a48b74f6AA18b108D725eC8f0b853E023ad44c
for verification on the block explorer. Waiting for verification result...

DEPRECATION WARNING: 'hardhat-etherscan' has been deprecated in favor of 'hardhat-verify'. You can find more information about the migration in the readme.
Error in plugin @nomiclabs/hardhat-etherscan: The contract verification failed.
Reason: Fail - Unable to verify

For more info run Hardhat with --show-stack-traces
iamdoraemon@MacBook-Pro shibadrop % npx hardhat --network shibarium verify --contract src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer 0x70a48b74f6AA18b108D725eC8f0b853E023ad44c
Warning: Since the VM version paris, "difficulty" was replaced by "prevrandao", which now returns a random number based on the beacon chain.
--> src/extensions/ERC721ShibaDropRandomOffset.sol:72:43:
|
72 | (uint256(keccak256(abi.encode(block.difficulty))) %
| ^^^^^^^^^^^^^^^^

Generating typings for: 84 artifacts in dir: typechain-types for target: ethers-v5
Successfully generated 216 typings!
Compiled 83 Solidity files successfully (evm target: paris).
Successfully submitted source code for contract
src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer at 0x70a48b74f6AA18b108D725eC8f0b853E023ad44c
for verification on the block explorer. Waiting for verification result...

We tried verifying your contract ERC1155ShibaDropConfigurer without including any unrelated one, but it failed.
Trying again with the full solc input used to compile and deploy it.
This means that unrelated contracts may be displayed on Etherscan...

Successfully submitted source code for contract
src/lib/ERC1155/ERC1155ShibaDropConfigurer.sol:ERC1155ShibaDropConfigurer at 0x70a48b74f6AA18b108D725eC8f0b853E023ad44c
for verification on the block explorer. Waiting for verification result...

DEPRECATION WARNING: 'hardhat-etherscan' has been deprecated in favor of 'hardhat-verify'. You can find more information about the migration in the readme.
Error in plugin @nomiclabs/hardhat-etherscan: The contract verification failed.
Reason: Fail - Unable to verify

For more info run Hardhat with --show-stack-traces
iamdoraemon@MacBook-Pro shibadrop % cd ../marketplace-escrow
iamdoraemon@MacBook-Pro marketplace-escrow % forge clean
iamdoraemon@MacBook-Pro marketplace-escrow % git branch
feature/update/marketplace/contract

- main
  iamdoraemon@MacBook-Pro marketplace-escrow % forge clean
  iamdoraemon@MacBook-Pro marketplace-escrow % forge build
  [⠊] Compiling...
  [⠔] Compiling 73 files with 0.8.20
  [⠃] Solc 0.8.20 finished in 6.65s
  Compiler run successful with warnings:
  Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
  --> src/Marketplace.sol:107:9:
  |
  107 | address operator,
  | ^^^^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:108:9:
|
108 | address from,
| ^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:109:9:
|
109 | uint256 id,
| ^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:110:9:
|
110 | uint256 value,
| ^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:111:9:
|
111 | bytes calldata data
| ^^^^^^^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:121:9:
|
121 | address operator,
| ^^^^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:122:9:
|
122 | address from,
| ^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:123:9:
|
123 | uint256[] calldata ids,
| ^^^^^^^^^^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:124:9:
|
124 | uint256[] calldata values,
| ^^^^^^^^^^^^^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> src/Marketplace.sol:125:9:
|
125 | bytes calldata data
| ^^^^^^^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> test/Marketplace.t.sol:304:9:
|
304 | address operator,
| ^^^^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> test/Marketplace.t.sol:305:9:
|
305 | address from,
| ^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> test/Marketplace.t.sol:306:9:
|
306 | uint256 id,
| ^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> test/Marketplace.t.sol:307:9:
|
307 | uint256 value,
| ^^^^^^^^^^^^^

Warning (5667): Unused function parameter. Remove or comment out the variable name to silence this warning.
--> test/Marketplace.t.sol:308:9:
|
308 | bytes calldata data
| ^^^^^^^^^^^^^^^^^^^

Warning (2018): Function state mutability can be restricted to view
--> lib/openzeppelin-foundry-upgrades/src/internal/Utils.sol:122:5:
|
122 | function getOutDir() internal returns (string memory) {
| ^ (Relevant source part starts here and spans across multiple lines).

Warning (2018): Function state mutability can be restricted to pure
--> src/Marketplace.sol:106:5:
|
106 | function onERC1155Received(
| ^ (Relevant source part starts here and spans across multiple lines).

Warning (2018): Function state mutability can be restricted to pure
--> src/Marketplace.sol:120:5:
|
120 | function onERC1155BatchReceived(
| ^ (Relevant source part starts here and spans across multiple lines).

Warning (2018): Function state mutability can be restricted to pure
--> test/Marketplace.t.sol:303:5:
|
303 | function onERC1155Received(
| ^ (Relevant source part starts here and spans across multiple lines).

iamdoraemon@MacBook-Pro marketplace-escrow % vi .env
iamdoraemon@MacBook-Pro marketplace-escrow % ls
LICENSE.md broadcast lib script
README.md cache out src
ReviewMarketplaceContract.md foundry.toml remappings.txt test
iamdoraemon@MacBook-Pro marketplace-escrow % vi foundry.toml
iamdoraemon@MacBook-Pro marketplace-escrow % forge script script/Deploy.s.sol:Deploy --rpc-url shibarium --broadcast --verifier blockscout --verify --watch -vvvv --ffi
[⠒] Compiling...
No files changed, compilation skipped
Traces:
[10422791] Deploy::run()
├─ [0] VM::envAddress("DEPLOYER_ADDRESS") [staticcall]
│ └─ ← <env var value>
├─ [0] VM::envUint("PRIVATE_KEY") [staticcall]
│ └─ ← <env var value>
├─ [0] VM::startBroadcast(54850755874113423612917014033911921225650687624391195619462477877633154394833 [5.485e76])
│ └─ ← ()
├─ [0] VM::envOr("FOUNDRY_OUT", "out") [staticcall]
│ └─ ← <env var value>
├─ [0] VM::projectRoot() [staticcall]
│ └─ ← "/Users/iamdoraemon/Desktop/github.com/shibaone/marketplace-escrow"
├─ [0] VM::readFile("/Users/iamdoraemon/Desktop/github.com/shibaone/marketplace-escrow/out/Marketplace.sol/Marketplace.json") [staticcall]
│ └─ ← <file>
├─ [0] VM::parseJsonString("<stringified JSON>", ".ast.absolutePath") [staticcall]
│ └─ ← "src/Marketplace.sol"
├─ [0] VM::parseJsonString("<stringified JSON>", ".ast.license") [staticcall]
│ └─ ← "MIT"
├─ [0] VM::parseJsonString("<stringified JSON>", ".bytecode.object") [staticcall]
│ └─ ← "0x60a0604052306080523480156200001557600080fd5b506200002062000026565b620000da565b7ff0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00805468010000000000000000900460ff1615620000775760405163f92ee8a960e01b815260040160405180910390fd5b80546001600160401b0390811614620000d75780546001600160401b0319166001600160401b0390811782556040519081527fc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d29060200160405180910390a15b50565b608051613600620001046000396000818161262901528181612652015261282501526136006000f3fe6080604052600436106101795760003560e01c80638da5cb5b116100cb578063d05a7a4b1161007f578063f2fde38b11610059578063f2fde38b14610574578063f40219f114610594578063feaa4830146105b457600080fd5b8063d05a7a4b146104eb578063e148919114610518578063f23a6e611461052e57600080fd5b8063ad3cb1cc116100b0578063ad3cb1cc146103fc578063bc197c8114610452578063cf0f34c4146104cb57600080fd5b80638da5cb5b1461039f578063ac9d82cf146103e657600080fd5b80634d9879e31161012d5780636db5c8fd116101075780636db5c8fd14610354578063715018a61461036a5780637a1ac61e1461037f57600080fd5b80634d9879e3146103085780634f1ef2861461032c57806352d1902d1461033f57600080fd5b806331ea1a391161015e57806331ea1a39146102b357806334d99a8d146102d5578063355e6b43146102e857600080fd5b806301ffc9a71461018557806303988f84146101fc57600080fd5b3661018057005b600080fd5b34801561019157600080fd5b506101e76101a0366004612d53565b7fffffffff00000000000000000000000000000000000000000000000000000000167f4e2312e0000000000000000000000000000000000000000000000000000000001490565b60405190151581526020015b60405180910390f35b34801561020857600080fd5b5061029b610217366004612d95565b60006020819052908152604090208054600182015460028301546003840154600485015460058601546006870154600788015460089098015496976001600160a01b03968716978688169760ff600160a01b98899004811698978216979183169291820481169175010000000000000000000000000000000000000000009004168c565b6040516101f39c9b9a99989796959493929190612e21565b3480156102bf57600080fd5b506102d36102ce366004612d95565b6105c7565b005b6102d36102e3366004612d95565b61089b565b3480156102f457600080fd5b506102d3610303366004612d95565b611080565b34801561031457600080fd5b5061031e60015481565b6040519081526020016101f3565b6102d361033a366004612eea565b611147565b34801561034b57600080fd5b5061031e611166565b34801561036057600080fd5b5061031e60045481565b34801561037657600080fd5b506102d3611195565b34801561038b57600080fd5b506102d361039a366004612fcc565b6111a9565b3480156103ab57600080fd5b507f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546040516001600160a01b0390911681526020016101f3565b3480156103f257600080fd5b5061031e60035481565b34801561040857600080fd5b506104456040518060400160405280600581526020017f352e302e3000000000000000000000000000000000000000000000000000000081525081565b6040516101f39190613025565b34801561045e57600080fd5b5061049a61046d366004613104565b7fbc197c810000000000000000000000000000000000000000000000000000000098975050505050505050565b6040517fffffffff0000000000000000000000000000000000000000000000000000000090911681526020016101f3565b3480156104d757600080fd5b506102d36104e6366004612d95565b61134f565b3480156104f757600080fd5b5061050b610506366004612d95565b61135c565b6040516101f391906131c3565b34801561052457600080fd5b5061031e60025481565b34801561053a57600080fd5b5061049a61054936600461329e565b7ff23a6e61000000000000000000000000000000000000000000000000000000009695505050505050565b34801561058057600080fd5b506102d361058f36600461331a565b6114e6565b3480156105a057600080fd5b506102d36105af366004613344565b61153a565b6102d36105c23660046133c7565b611b5e565b6105cf612475565b600081815260208190526040902060018101546001600160a01b03163314610623576040517fc855b5ee00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60088101547501000000000000000000000000000000000000000000900460ff1661067a576040517f7df175fd00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6008810180547fffffffffffffffffffff00ffffffffffffffffffffffffffffffffffffffffff16905560006008820154600160a01b900460ff1660018111156106c6576106c6612dae565b03610761576008810154600182015460068301546040517f23b872dd0000000000000000000000000000000000000000000000000000000081523060048201526001600160a01b03928316602482015260448101919091529116906323b872dd90606401600060405180830381600087803b15801561074457600080fd5b505af1158015610758573d6000803e3d6000fd5b50505050610832565b60016008820154600160a01b900460ff16600181111561078357610783612dae565b036108325760088101546001820154600683015460078401546040517ff242432a0000000000000000000000000000000000000000000000000000000081523060048201526001600160a01b0393841660248201526044810192909252606482015260a06084820152600060a482015291169063f242432a9060c401600060405180830381600087803b15801561081957600080fd5b505af115801561082d573d6000803e3d6000fd5b505050505b60018101546040516001600160a01b039091169083907fccd8620ad8e19e75ba93dd221d1945d39d7c0c75bc1147e3f22c0fe2750c403690600090a35061089860017f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0055565b50565b6108a3612475565b600081815260208190526040902060088101547501000000000000000000000000000000000000000000900460ff16610908576040517f7df175fd00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b4281600501541015610946576040517f269fad9200000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006002820154600160a01b900460ff16600181111561096857610968612dae565b141580156109765750600034115b156109ad576040517ff599342800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60025415610c7b576000606460025483600401546109cb9190613438565b6109d5919061344f565b905060008183600401546109e9919061348a565b905060006002840154600160a01b900460ff166001811115610a0d57610a0d612dae565b03610aec578260040154341015610a50576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60018301546040516001600160a01b039091169082156108fc029083906000818181858888f19350505050158015610a8c573d6000803e3d6000fd5b507f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546040516001600160a01b039091169083156108fc029084906000818181858888f19350505050158015610ae6573d6000803e3d6000fd5b50610c74565b60016002840154600160a01b900460ff166001811115610b0e57610b0e612dae565b03610c425760038301546004808501546040517f70a0823100000000000000000000000000000000000000000000000000000000815233928101929092526001600160a01b03909216919082906370a0823190602401602060405180830381865afa158015610b81573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610ba5919061349d565b1015610bdd576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6001840154610bfb906001600160a01b03838116913391168561251c565b610ae633610c307f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546001600160a01b031690565b6001600160a01b03841691908661251c565b6040517ff599342800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b5050610e38565b600481015460006002830154600160a01b900460ff166001811115610ca257610ca2612dae565b03610d27578160040154341015610ce5576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60018201546040516001600160a01b039091169082156108fc029083906000818181858888f19350505050158015610d21573d6000803e3d6000fd5b50610e36565b60016002830154600160a01b900460ff166001811115610d4957610d49612dae565b03610c425760038201546004808401546040517f70a0823100000000000000000000000000000000000000000000000000000000815233928101929092526001600160a01b03909216919082906370a0823190602401602060405180830381865afa158015610dbc573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610de0919061349d565b1015610e18576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6001830154610d21906001600160a01b03838116913391168561251c565b505b6008810180547fffffffffffffffffffff00ffffffffffffffffffffffffffffffffffffffffff1690556002810180547fffffffffffffffffffffffff0000000000000000000000000000000000000000163317905560006008820154600160a01b900460ff166001811115610eb057610eb0612dae565b03610f4557600881015460068201546040517f23b872dd00000000000000000000000000000000000000000000000000000000815230600482015233602482015260448101919091526001600160a01b03909116906323b872dd90606401600060405180830381600087803b158015610f2857600080fd5b505af1158015610f3c573d6000803e3d6000fd5b50505050611010565b60016008820154600160a01b900460ff166001811115610f6757610f67612dae565b03611010576008810154600682015460078301546040517ff242432a0000000000000000000000000000000000000000000000000000000081523060048201523360248201526044810192909252606482015260a06084820152600060a48201526001600160a01b039091169063f242432a9060c401600060405180830381600087803b158015610ff757600080fd5b505af115801561100b573d6000803e3d6000fd5b505050505b60018101546040516001600160a01b039091168152339083907fbacb7225266f3381d7544a532703d91b8f97fadb38b122e13f1d951ed02a37769060200160405180910390a35061089860017f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0055565b6110886125aa565b801580611096575060035481115b15611102576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601260248201527f496e76616c696420636f6d6d697373696f6e000000000000000000000000000060448201526064015b60405180910390fd5b600280549082905560408051828152602081018490527f9b8c4484ba5e4a0dde5339b45a03dd83281d6b1958617ee553dfbcd3532b0e2a910160405180910390a15050565b61114f61261e565b611158826126ee565b61116282826126f6565b5050565b600061117061281a565b507f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc90565b61119d6125aa565b6111a7600061287c565b565b7ff0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00805468010000000000000000810460ff16159067ffffffffffffffff166000811580156111f45750825b905060008267ffffffffffffffff1660011480156112115750303b155b90508115801561121f575080155b15611256576040517ff92ee8a900000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b84547fffffffffffffffffffffffffffffffffffffffffffffffff000000000000000016600117855583156112b75784547fffffffffffffffffffffffffffffffffffffffffffffff00ffffffffffffffff16680100000000000000001785555b6112c088612905565b6112c8612916565b6112d0612926565b600060018190556002556003879055600486905583156113455784547fffffffffffffffffffffffffffffffffffffffffffffff00ffffffffffffffff168555604051600181527fc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d29060200160405180910390a15b5050505050505050565b6113576125aa565b600455565b6040805161018081018252600080825260208201819052918101829052606081018290526080810182905260a0810182905260c0810182905260e0810182905261010081018290526101208101829052610140810182905261016081019190915260008281526020818152604091829020825161018081018452815481526001808301546001600160a01b03908116948301949094526002830154938416948201949094529290916060840191600160a01b90910460ff169081111561142457611424612dae565b600181111561143557611435612dae565b815260038201546001600160a01b039081166020830152600483015460408301526005830154606083015260068301546080830152600783015460a0830152600883015490811660c083015260e090910190600160a01b900460ff1660018111156114a2576114a2612dae565b60018111156114b3576114b3612dae565b8152600891909101547501000000000000000000000000000000000000000000900460ff16151560209091015292915050565b6114ee6125aa565b6001600160a01b038116611531576040517f1e4fbdf7000000000000000000000000000000000000000000000000000000008152600060048201526024016110f9565b6108988161287c565b600454811115611576576040517f7616640100000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b600085600181111561158a5761158a612dae565b036116db576040517f6352211e00000000000000000000000000000000000000000000000000000000815260048101899052869033906001600160a01b03831690636352211e90602401602060405180830381865afa1580156115f1573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061161591906134b6565b6001600160a01b031614611655576040517f4088c61c00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6040517f23b872dd000000000000000000000000000000000000000000000000000000008152336004820152306024820152604481018a90526001600160a01b038216906323b872dd906064015b600060405180830381600087803b1580156116bd57600080fd5b505af11580156116d1573d6000803e3d6000fd5b505050505061187f565b60018560018111156116ef576116ef612dae565b0361181d576040517efdd58e00000000000000000000000000000000000000000000000000000000815233600482015260248101899052869088906001600160a01b0383169062fdd58e90604401602060405180830381865afa15801561175a573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061177e919061349d565b10156117b6576040517f4088c61c00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6040517ff242432a000000000000000000000000000000000000000000000000000000008152336004820152306024820152604481018a90526064810189905260a06084820152600060a48201526001600160a01b0382169063f242432a9060c4016116a3565b6040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601660248201527f496e76616c696420746f6b656e207374616e646172640000000000000000000060448201526064016110f9565b6001805460009182611890836134d3565b90915550905060006118a2834261350b565b9050604051806101800160405280838152602001336001600160a01b0316815260200160006001600160a01b031681526020018760018111156118e7576118e7612dae565b8152602001866001600160a01b031681526020018581526020018281526020018b81526020018a8152602001896001600160a01b0316815260200188600181111561193457611934612dae565b8152600160209182018190526000858152808352604090819020845181559284015183830180547fffffffffffffffffffffffff00000000000000000000000000000000000000009081166001600160a01b03938416179091559185015160028501805493841691909216908117825560608601519391927fffffffffffffffffffffff000000000000000000000000000000000000000000161790600160a01b9084908111156119e7576119e7612dae565b021790555060808201516003820180547fffffffffffffffffffffffff00000000000000000000000000000000000000009081166001600160a01b039384161790915560a0840151600484015560c0840151600584015560e08401516006840155610100840151600784015561012084015160088401805492831691909316908117835561014085015192917fffffffffffffffffffffff0000000000000000000000000000000000000000001617600160a01b836001811115611aad57611aad612dae565b02179055506101609190910151600890910180549115157501000000000000000000000000000000000000000000027fffffffffffffffffffff00ffffffffffffffffffffffffffffffffffffffffff909216919091179055604051339083907f8e7a1a5dab1ed7b740e4ea1ee4d56581c2a8715d4a3625552e6da7bacf03a6bc90611b4a908e908e908e908e908e908e908e908e908d9061351e565b60405180910390a350505050505050505050565b611b66612475565b6064811115611ba1576040517ff7b66c5100000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60008080805b84811015611e6d576000806000888885818110611bc657611bc6613586565b6020908102929092013583525081019190915260400160002060018101549091506001600160a01b0316611c26576040517f0a67de6b00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60088101547501000000000000000000000000000000000000000000900460ff16611c7d576040517f7df175fd00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b4281600501541015611cbb576040517f269fad9200000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006002820154600160a01b900460ff166001811115611cdd57611cdd612dae565b14158015611ceb5750600034115b15611d22576040517ff599342800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006002820154600160a01b900460ff166001811115611d4457611d44612dae565b03611d5f576004810154611d58908661350b565b9450611e5a565b60016002820154600160a01b900460ff166001811115611d8157611d81612dae565b03610c42576001600160a01b038316611da95760038101546001600160a01b03169250611e48565b60038101546001600160a01b03848116911614611e48576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152603160248201527f4d756c7469706c6520455243323020746f6b656e73206e6f7420737570706f7260448201527f74656420696e2062756c6b206465616c7300000000000000000000000000000060648201526084016110f9565b6004810154611e57908561350b565b93505b5080611e65816134d3565b915050611ba7565b50600083118015611e7d57508234105b15611eb4576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b8115611f79576040517f70a08231000000000000000000000000000000000000000000000000000000008152336004820152819083906001600160a01b038316906370a0823190602401602060405180830381865afa158015611f1b573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190611f3f919061349d565b1015611f77576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b505b60005b84811015612448576000806000888885818110611f9b57611f9b613586565b90506020020135815260200190815260200160002090506000600254111561214057600060646002548360040154611fd39190613438565b611fdd919061344f565b90506000818360040154611ff1919061348a565b905060006002840154600160a01b900460ff16600181111561201557612015612dae565b036120b65760018301546040516001600160a01b039091169082156108fc029083906000818181858888f19350505050158015612056573d6000803e3d6000fd5b507f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546040516001600160a01b039091169083156108fc029084906000818181858888f193505050501580156120b0573d6000803e3d6000fd5b50612139565b60016002840154600160a01b900460ff1660018111156120d8576120d8612dae565b0361213957600383015460018401546001600160a01b03918216916121029183913391168561251c565b61213733610c307f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546001600160a01b031690565b505b50506121fe565b600481015460006002830154600160a01b900460ff16600181111561216757612167612dae565b036121ae5760018201546040516001600160a01b039091169082156108fc029083906000818181858888f193505050501580156121a8573d6000803e3d6000fd5b506121fc565b60016002830154600160a01b900460ff1660018111156121d0576121d0612dae565b036121fc57600382015460018301546001600160a01b03918216916121fa9183913391168561251c565b505b505b6008810180547fffffffffffffffffffff00ffffffffffffffffffffffffffffffffffffffffff1690556002810180547fffffffffffffffffffffffff0000000000000000000000000000000000000000163317905560006008820154600160a01b900460ff16600181111561227657612276612dae565b0361230b57600881015460068201546040517f23b872dd00000000000000000000000000000000000000000000000000000000815230600482015233602482015260448101919091526001600160a01b03909116906323b872dd90606401600060405180830381600087803b1580156122ee57600080fd5b505af1158015612302573d6000803e3d6000fd5b505050506123d6565b60016008820154600160a01b900460ff16600181111561232d5761232d612dae565b036123d6576008810154600682015460078301546040517ff242432a0000000000000000000000000000000000000000000000000000000081523060048201523360248201526044810192909252606482015260a06084820152600060a48201526001600160a01b039091169063f242432a9060c401600060405180830381600087803b1580156123bd57600080fd5b505af11580156123d1573d6000803e3d6000fd5b505050505b338787848181106123e9576123e9613586565b60018501546040516001600160a01b03909116815260209182029390930135927fbacb7225266f3381d7544a532703d91b8f97fadb38b122e13f1d951ed02a377692500160405180910390a35080612440816134d3565b915050611f7c565b5050505061116260017f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0055565b7f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0080547ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe016124f0576040517f3ee5aeb500000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60029055565b60017f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0055565b604080516001600160a01b0385811660248301528416604482015260648082018490528251808303909101815260849091019091526020810180517bffffffffffffffffffffffffffffffffffffffffffffffffffffffff167f23b872dd000000000000000000000000000000000000000000000000000000001790526125a490859061292e565b50505050565b336125dc7f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546001600160a01b031690565b6001600160a01b0316146111a7576040517f118cdaa70000000000000000000000000000000000000000000000000000000081523360048201526024016110f9565b306001600160a01b037f00000000000000000000000000000000000000000000000000000000000000001614806126b757507f00000000000000000000000000000000000000000000000000000000000000006001600160a01b03166126ab7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc546001600160a01b031690565b6001600160a01b031614155b156111a7576040517fe07c8dba00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6108986125aa565b816001600160a01b03166352d1902d6040518163ffffffff1660e01b8152600401602060405180830381865afa92505050801561276e575060408051601f3d9081017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe016820190925261276b9181019061349d565b60015b6127af576040517f4c9c8ce30000000000000000000000000000000000000000000000000000000081526001600160a01b03831660048201526024016110f9565b7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc811461280b576040517faa1d49a4000000000000000000000000000000000000000000000000000000008152600481018290526024016110f9565b61281583836129aa565b505050565b306001600160a01b037f000000000000000000000000000000000000000000000000000000000000000016146111a7576040517fe07c8dba00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b7f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c19930080547fffffffffffffffffffffffff000000000000000000000000000000000000000081166001600160a01b03848116918217845560405192169182907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a3505050565b61290d612a00565b61089881612a67565b61291e612a00565b6111a7612a6f565b6111a7612a00565b60006129436001600160a01b03841683612a77565b9050805160001415801561296857508080602001905181019061296691906135b5565b155b15612815576040517f5274afe70000000000000000000000000000000000000000000000000000000081526001600160a01b03841660048201526024016110f9565b6129b382612a8e565b6040516001600160a01b038316907fbc7cd75a20ee27fd9adebab32041f755214dbc6bffa90cc0225b39da2e5c2d3b90600090a28051156129f8576128158282612b36565b611162612bac565b7ff0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a005468010000000000000000900460ff166111a7576040517fd7e6bcf800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6114ee612a00565b6124f6612a00565b6060612a8583836000612be4565b90505b92915050565b806001600160a01b03163b600003612add576040517f4c9c8ce30000000000000000000000000000000000000000000000000000000081526001600160a01b03821660048201526024016110f9565b7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc80547fffffffffffffffffffffffff0000000000000000000000000000000000000000166001600160a01b0392909216919091179055565b6060600080846001600160a01b031684604051612b5391906135d7565b600060405180830381855af49150503d8060008114612b8e576040519150601f19603f3d011682016040523d82523d6000602084013e612b93565b606091505b5091509150612ba3858383612c9c565b95945050505050565b34156111a7576040517fb398979f00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b606081471015612c22576040517fcd7860590000000000000000000000000000000000000000000000000000000081523060048201526024016110f9565b600080856001600160a01b03168486604051612c3e91906135d7565b60006040518083038185875af1925050503d8060008114612c7b576040519150601f19603f3d011682016040523d82523d6000602084013e612c80565b606091505b5091509150612c90868383612c9c565b925050505b9392505050565b606082612cb157612cac82612d11565b612c95565b8151158015612cc857506001600160a01b0384163b155b15612d0a576040517f9996b3150000000000000000000000000000000000000000000000000000000081526001600160a01b03851660048201526024016110f9565b5080612c95565b805115612d215780518082602001fd5b6040517f1425ea4200000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b600060208284031215612d6557600080fd5b81357fffffffff0000000000000000000000000000000000000000000000000000000081168114612c9557600080fd5b600060208284031215612da757600080fd5b5035919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602160045260246000fd5b60028110610898577f4e487b7100000000000000000000000000000000000000000000000000000000600052602160045260246000fd5b612e1d81612ddd565b9052565b8c81526001600160a01b038c811660208301528b81166040830152610180820190612e4b8c612ddd565b8b6060840152808b1660808401528960a08401528860c08401528760e08401528661010084015280861661012084015250612e8584612ddd565b836101408301528215156101608301529d9c50505050505050505050505050565b6001600160a01b038116811461089857600080fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b60008060408385031215612efd57600080fd5b8235612f0881612ea6565b9150602083013567ffffffffffffffff80821115612f2557600080fd5b818501915085601f830112612f3957600080fd5b813581811115612f4b57612f4b612ebb565b604051601f82017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0908116603f01168101908382118183101715612f9157612f91612ebb565b81604052828152886020848701011115612faa57600080fd5b8260208601602083013760006020848301015280955050505050509250929050565b600080600060608486031215612fe157600080fd5b8335612fec81612ea6565b95602085013595506040909401359392505050565b60005b8381101561301c578181015183820152602001613004565b50506000910152565b6020815260008251806020840152613044816040850160208701613001565b601f017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0169190910160400192915050565b60008083601f84011261308857600080fd5b50813567ffffffffffffffff8111156130a057600080fd5b6020830191508360208260051b85010111156130bb57600080fd5b9250929050565b60008083601f8401126130d457600080fd5b50813567ffffffffffffffff8111156130ec57600080fd5b6020830191508360208285010111156130bb57600080fd5b60008060008060008060008060a0898b03121561312057600080fd5b883561312b81612ea6565b9750602089013561313b81612ea6565b9650604089013567ffffffffffffffff8082111561315857600080fd5b6131648c838d01613076565b909850965060608b013591508082111561317d57600080fd5b6131898c838d01613076565b909650945060808b01359150808211156131a257600080fd5b506131af8b828c016130c2565b999c989b5096995094979396929594505050565b815181526020808301516101808301916131e7908401826001600160a01b03169052565b50604083015161320260408401826001600160a01b03169052565b5060608301516132156060840182612e14565b50608083015161323060808401826001600160a01b03169052565b5060a083015160a083015260c083015160c083015260e083015160e083015261010080840151818401525061012080840151613276828501826001600160a01b03169052565b50506101408084015161328b82850182612e14565b5050610160928301511515919092015290565b60008060008060008060a087890312156132b757600080fd5b86356132c281612ea6565b955060208701356132d281612ea6565b94506040870135935060608701359250608087013567ffffffffffffffff8111156132fc57600080fd5b61330889828a016130c2565b979a9699509497509295939492505050565b60006020828403121561332c57600080fd5b8135612c9581612ea6565b6002811061089857600080fd5b600080600080600080600080610100898b03121561336157600080fd5b8835975060208901359650604089013561337a81612ea6565b9550606089013561338a81613337565b9450608089013561339a81613337565b935060a08901356133aa81612ea6565b979a969950949793969295929450505060c08201359160e0013590565b600080602083850312156133da57600080fd5b823567ffffffffffffffff8111156133f157600080fd5b6133fd85828601613076565b90969095509350505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b8082028115828204841417612a8857612a88613409565b600082613485577f4e487b7100000000000000000000000000000000000000000000000000000000600052601260045260246000fd5b500490565b81810381811115612a8857612a88613409565b6000602082840312156134af57600080fd5b5051919050565b6000602082840312156134c857600080fd5b8151612c9581612ea6565b60007fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff820361350457613504613409565b5060010190565b80820180821115612a8857612a88613409565b898152602081018990526001600160a01b03888116604083015261012082019061354789612ddd565b88606084015261355688612ddd565b87608084015280871660a0840152508460c08301528360e0830152826101008301529a9950505050505050505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052603260045260246000fd5b6000602082840312156135c757600080fd5b81518015158114612c9557600080fd5b600082516135e9818460208701613001565b919091019291505056fea164736f6c6343000814000a"
├─ [0] VM::envOr("OPENZEPPELIN_BASH_PATH", "bash") [staticcall]
│ └─ ← <env var value>
├─ [0] VM::tryFfi(["bash", "-c", "npx @openzeppelin/upgrades-core@^1.32.3 validate out/build-info --contract src/Marketplace.sol:Marketplace"])
│ └─ ← (0, 0xe29c9420207372632f4d61726b6574706c6163652e736f6c3a4d61726b6574706c6163650a0a53554343455353, 0x)
├─ [0] VM::getCode("Marketplace.sol") [staticcall]
│ └─ ← 0x60a0604052306080523480156200001557600080fd5b506200002062000026565b620000da565b7ff0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00805468010000000000000000900460ff1615620000775760405163f92ee8a960e01b815260040160405180910390fd5b80546001600160401b0390811614620000d75780546001600160401b0319166001600160401b0390811782556040519081527fc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d29060200160405180910390a15b50565b608051613600620001046000396000818161262901528181612652015261282501526136006000f3fe6080604052600436106101795760003560e01c80638da5cb5b116100cb578063d05a7a4b1161007f578063f2fde38b11610059578063f2fde38b14610574578063f40219f114610594578063feaa4830146105b457600080fd5b8063d05a7a4b146104eb578063e148919114610518578063f23a6e611461052e57600080fd5b8063ad3cb1cc116100b0578063ad3cb1cc146103fc578063bc197c8114610452578063cf0f34c4146104cb57600080fd5b80638da5cb5b1461039f578063ac9d82cf146103e657600080fd5b80634d9879e31161012d5780636db5c8fd116101075780636db5c8fd14610354578063715018a61461036a5780637a1ac61e1461037f57600080fd5b80634d9879e3146103085780634f1ef2861461032c57806352d1902d1461033f57600080fd5b806331ea1a391161015e57806331ea1a39146102b357806334d99a8d146102d5578063355e6b43146102e857600080fd5b806301ffc9a71461018557806303988f84146101fc57600080fd5b3661018057005b600080fd5b34801561019157600080fd5b506101e76101a0366004612d53565b7fffffffff00000000000000000000000000000000000000000000000000000000167f4e2312e0000000000000000000000000000000000000000000000000000000001490565b60405190151581526020015b60405180910390f35b34801561020857600080fd5b5061029b610217366004612d95565b60006020819052908152604090208054600182015460028301546003840154600485015460058601546006870154600788015460089098015496976001600160a01b03968716978688169760ff600160a01b98899004811698978216979183169291820481169175010000000000000000000000000000000000000000009004168c565b6040516101f39c9b9a99989796959493929190612e21565b3480156102bf57600080fd5b506102d36102ce366004612d95565b6105c7565b005b6102d36102e3366004612d95565b61089b565b3480156102f457600080fd5b506102d3610303366004612d95565b611080565b34801561031457600080fd5b5061031e60015481565b6040519081526020016101f3565b6102d361033a366004612eea565b611147565b34801561034b57600080fd5b5061031e611166565b34801561036057600080fd5b5061031e60045481565b34801561037657600080fd5b506102d3611195565b34801561038b57600080fd5b506102d361039a366004612fcc565b6111a9565b3480156103ab57600080fd5b507f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546040516001600160a01b0390911681526020016101f3565b3480156103f257600080fd5b5061031e60035481565b34801561040857600080fd5b506104456040518060400160405280600581526020017f352e302e3000000000000000000000000000000000000000000000000000000081525081565b6040516101f39190613025565b34801561045e57600080fd5b5061049a61046d366004613104565b7fbc197c810000000000000000000000000000000000000000000000000000000098975050505050505050565b6040517fffffffff0000000000000000000000000000000000000000000000000000000090911681526020016101f3565b3480156104d757600080fd5b506102d36104e6366004612d95565b61134f565b3480156104f757600080fd5b5061050b610506366004612d95565b61135c565b6040516101f391906131c3565b34801561052457600080fd5b5061031e60025481565b34801561053a57600080fd5b5061049a61054936600461329e565b7ff23a6e61000000000000000000000000000000000000000000000000000000009695505050505050565b34801561058057600080fd5b506102d361058f36600461331a565b6114e6565b3480156105a057600080fd5b506102d36105af366004613344565b61153a565b6102d36105c23660046133c7565b611b5e565b6105cf612475565b600081815260208190526040902060018101546001600160a01b03163314610623576040517fc855b5ee00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60088101547501000000000000000000000000000000000000000000900460ff1661067a576040517f7df175fd00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6008810180547fffffffffffffffffffff00ffffffffffffffffffffffffffffffffffffffffff16905560006008820154600160a01b900460ff1660018111156106c6576106c6612dae565b03610761576008810154600182015460068301546040517f23b872dd0000000000000000000000000000000000000000000000000000000081523060048201526001600160a01b03928316602482015260448101919091529116906323b872dd90606401600060405180830381600087803b15801561074457600080fd5b505af1158015610758573d6000803e3d6000fd5b50505050610832565b60016008820154600160a01b900460ff16600181111561078357610783612dae565b036108325760088101546001820154600683015460078401546040517ff242432a0000000000000000000000000000000000000000000000000000000081523060048201526001600160a01b0393841660248201526044810192909252606482015260a06084820152600060a482015291169063f242432a9060c401600060405180830381600087803b15801561081957600080fd5b505af115801561082d573d6000803e3d6000fd5b505050505b60018101546040516001600160a01b039091169083907fccd8620ad8e19e75ba93dd221d1945d39d7c0c75bc1147e3f22c0fe2750c403690600090a35061089860017f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0055565b50565b6108a3612475565b600081815260208190526040902060088101547501000000000000000000000000000000000000000000900460ff16610908576040517f7df175fd00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b4281600501541015610946576040517f269fad9200000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006002820154600160a01b900460ff16600181111561096857610968612dae565b141580156109765750600034115b156109ad576040517ff599342800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60025415610c7b576000606460025483600401546109cb9190613438565b6109d5919061344f565b905060008183600401546109e9919061348a565b905060006002840154600160a01b900460ff166001811115610a0d57610a0d612dae565b03610aec578260040154341015610a50576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60018301546040516001600160a01b039091169082156108fc029083906000818181858888f19350505050158015610a8c573d6000803e3d6000fd5b507f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546040516001600160a01b039091169083156108fc029084906000818181858888f19350505050158015610ae6573d6000803e3d6000fd5b50610c74565b60016002840154600160a01b900460ff166001811115610b0e57610b0e612dae565b03610c425760038301546004808501546040517f70a0823100000000000000000000000000000000000000000000000000000000815233928101929092526001600160a01b03909216919082906370a0823190602401602060405180830381865afa158015610b81573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610ba5919061349d565b1015610bdd576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6001840154610bfb906001600160a01b03838116913391168561251c565b610ae633610c307f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546001600160a01b031690565b6001600160a01b03841691908661251c565b6040517ff599342800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b5050610e38565b600481015460006002830154600160a01b900460ff166001811115610ca257610ca2612dae565b03610d27578160040154341015610ce5576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60018201546040516001600160a01b039091169082156108fc029083906000818181858888f19350505050158015610d21573d6000803e3d6000fd5b50610e36565b60016002830154600160a01b900460ff166001811115610d4957610d49612dae565b03610c425760038201546004808401546040517f70a0823100000000000000000000000000000000000000000000000000000000815233928101929092526001600160a01b03909216919082906370a0823190602401602060405180830381865afa158015610dbc573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610de0919061349d565b1015610e18576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6001830154610d21906001600160a01b03838116913391168561251c565b505b6008810180547fffffffffffffffffffff00ffffffffffffffffffffffffffffffffffffffffff1690556002810180547fffffffffffffffffffffffff0000000000000000000000000000000000000000163317905560006008820154600160a01b900460ff166001811115610eb057610eb0612dae565b03610f4557600881015460068201546040517f23b872dd00000000000000000000000000000000000000000000000000000000815230600482015233602482015260448101919091526001600160a01b03909116906323b872dd90606401600060405180830381600087803b158015610f2857600080fd5b505af1158015610f3c573d6000803e3d6000fd5b50505050611010565b60016008820154600160a01b900460ff166001811115610f6757610f67612dae565b03611010576008810154600682015460078301546040517ff242432a0000000000000000000000000000000000000000000000000000000081523060048201523360248201526044810192909252606482015260a06084820152600060a48201526001600160a01b039091169063f242432a9060c401600060405180830381600087803b158015610ff757600080fd5b505af115801561100b573d6000803e3d6000fd5b505050505b60018101546040516001600160a01b039091168152339083907fbacb7225266f3381d7544a532703d91b8f97fadb38b122e13f1d951ed02a37769060200160405180910390a35061089860017f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0055565b6110886125aa565b801580611096575060035481115b15611102576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601260248201527f496e76616c696420636f6d6d697373696f6e000000000000000000000000000060448201526064015b60405180910390fd5b600280549082905560408051828152602081018490527f9b8c4484ba5e4a0dde5339b45a03dd83281d6b1958617ee553dfbcd3532b0e2a910160405180910390a15050565b61114f61261e565b611158826126ee565b61116282826126f6565b5050565b600061117061281a565b507f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc90565b61119d6125aa565b6111a7600061287c565b565b7ff0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a00805468010000000000000000810460ff16159067ffffffffffffffff166000811580156111f45750825b905060008267ffffffffffffffff1660011480156112115750303b155b90508115801561121f575080155b15611256576040517ff92ee8a900000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b84547fffffffffffffffffffffffffffffffffffffffffffffffff000000000000000016600117855583156112b75784547fffffffffffffffffffffffffffffffffffffffffffffff00ffffffffffffffff16680100000000000000001785555b6112c088612905565b6112c8612916565b6112d0612926565b600060018190556002556003879055600486905583156113455784547fffffffffffffffffffffffffffffffffffffffffffffff00ffffffffffffffff168555604051600181527fc7f505b2f371ae2175ee4913f4499e1f2633a7b5936321eed1cdaeb6115181d29060200160405180910390a15b5050505050505050565b6113576125aa565b600455565b6040805161018081018252600080825260208201819052918101829052606081018290526080810182905260a0810182905260c0810182905260e0810182905261010081018290526101208101829052610140810182905261016081019190915260008281526020818152604091829020825161018081018452815481526001808301546001600160a01b03908116948301949094526002830154938416948201949094529290916060840191600160a01b90910460ff169081111561142457611424612dae565b600181111561143557611435612dae565b815260038201546001600160a01b039081166020830152600483015460408301526005830154606083015260068301546080830152600783015460a0830152600883015490811660c083015260e090910190600160a01b900460ff1660018111156114a2576114a2612dae565b60018111156114b3576114b3612dae565b8152600891909101547501000000000000000000000000000000000000000000900460ff16151560209091015292915050565b6114ee6125aa565b6001600160a01b038116611531576040517f1e4fbdf7000000000000000000000000000000000000000000000000000000008152600060048201526024016110f9565b6108988161287c565b600454811115611576576040517f7616640100000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b600085600181111561158a5761158a612dae565b036116db576040517f6352211e00000000000000000000000000000000000000000000000000000000815260048101899052869033906001600160a01b03831690636352211e90602401602060405180830381865afa1580156115f1573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061161591906134b6565b6001600160a01b031614611655576040517f4088c61c00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6040517f23b872dd000000000000000000000000000000000000000000000000000000008152336004820152306024820152604481018a90526001600160a01b038216906323b872dd906064015b600060405180830381600087803b1580156116bd57600080fd5b505af11580156116d1573d6000803e3d6000fd5b505050505061187f565b60018560018111156116ef576116ef612dae565b0361181d576040517efdd58e00000000000000000000000000000000000000000000000000000000815233600482015260248101899052869088906001600160a01b0383169062fdd58e90604401602060405180830381865afa15801561175a573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061177e919061349d565b10156117b6576040517f4088c61c00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6040517ff242432a000000000000000000000000000000000000000000000000000000008152336004820152306024820152604481018a90526064810189905260a06084820152600060a48201526001600160a01b0382169063f242432a9060c4016116a3565b6040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601660248201527f496e76616c696420746f6b656e207374616e646172640000000000000000000060448201526064016110f9565b6001805460009182611890836134d3565b90915550905060006118a2834261350b565b9050604051806101800160405280838152602001336001600160a01b0316815260200160006001600160a01b031681526020018760018111156118e7576118e7612dae565b8152602001866001600160a01b031681526020018581526020018281526020018b81526020018a8152602001896001600160a01b0316815260200188600181111561193457611934612dae565b8152600160209182018190526000858152808352604090819020845181559284015183830180547fffffffffffffffffffffffff00000000000000000000000000000000000000009081166001600160a01b03938416179091559185015160028501805493841691909216908117825560608601519391927fffffffffffffffffffffff000000000000000000000000000000000000000000161790600160a01b9084908111156119e7576119e7612dae565b021790555060808201516003820180547fffffffffffffffffffffffff00000000000000000000000000000000000000009081166001600160a01b039384161790915560a0840151600484015560c0840151600584015560e08401516006840155610100840151600784015561012084015160088401805492831691909316908117835561014085015192917fffffffffffffffffffffff0000000000000000000000000000000000000000001617600160a01b836001811115611aad57611aad612dae565b02179055506101609190910151600890910180549115157501000000000000000000000000000000000000000000027fffffffffffffffffffff00ffffffffffffffffffffffffffffffffffffffffff909216919091179055604051339083907f8e7a1a5dab1ed7b740e4ea1ee4d56581c2a8715d4a3625552e6da7bacf03a6bc90611b4a908e908e908e908e908e908e908e908e908d9061351e565b60405180910390a350505050505050505050565b611b66612475565b6064811115611ba1576040517ff7b66c5100000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60008080805b84811015611e6d576000806000888885818110611bc657611bc6613586565b6020908102929092013583525081019190915260400160002060018101549091506001600160a01b0316611c26576040517f0a67de6b00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60088101547501000000000000000000000000000000000000000000900460ff16611c7d576040517f7df175fd00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b4281600501541015611cbb576040517f269fad9200000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006002820154600160a01b900460ff166001811115611cdd57611cdd612dae565b14158015611ceb5750600034115b15611d22576040517ff599342800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006002820154600160a01b900460ff166001811115611d4457611d44612dae565b03611d5f576004810154611d58908661350b565b9450611e5a565b60016002820154600160a01b900460ff166001811115611d8157611d81612dae565b03610c42576001600160a01b038316611da95760038101546001600160a01b03169250611e48565b60038101546001600160a01b03848116911614611e48576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152603160248201527f4d756c7469706c6520455243323020746f6b656e73206e6f7420737570706f7260448201527f74656420696e2062756c6b206465616c7300000000000000000000000000000060648201526084016110f9565b6004810154611e57908561350b565b93505b5080611e65816134d3565b915050611ba7565b50600083118015611e7d57508234105b15611eb4576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b8115611f79576040517f70a08231000000000000000000000000000000000000000000000000000000008152336004820152819083906001600160a01b038316906370a0823190602401602060405180830381865afa158015611f1b573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190611f3f919061349d565b1015611f77576040517ff4d678b800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b505b60005b84811015612448576000806000888885818110611f9b57611f9b613586565b90506020020135815260200190815260200160002090506000600254111561214057600060646002548360040154611fd39190613438565b611fdd919061344f565b90506000818360040154611ff1919061348a565b905060006002840154600160a01b900460ff16600181111561201557612015612dae565b036120b65760018301546040516001600160a01b039091169082156108fc029083906000818181858888f19350505050158015612056573d6000803e3d6000fd5b507f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546040516001600160a01b039091169083156108fc029084906000818181858888f193505050501580156120b0573d6000803e3d6000fd5b50612139565b60016002840154600160a01b900460ff1660018111156120d8576120d8612dae565b0361213957600383015460018401546001600160a01b03918216916121029183913391168561251c565b61213733610c307f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546001600160a01b031690565b505b50506121fe565b600481015460006002830154600160a01b900460ff16600181111561216757612167612dae565b036121ae5760018201546040516001600160a01b039091169082156108fc029083906000818181858888f193505050501580156121a8573d6000803e3d6000fd5b506121fc565b60016002830154600160a01b900460ff1660018111156121d0576121d0612dae565b036121fc57600382015460018301546001600160a01b03918216916121fa9183913391168561251c565b505b505b6008810180547fffffffffffffffffffff00ffffffffffffffffffffffffffffffffffffffffff1690556002810180547fffffffffffffffffffffffff0000000000000000000000000000000000000000163317905560006008820154600160a01b900460ff16600181111561227657612276612dae565b0361230b57600881015460068201546040517f23b872dd00000000000000000000000000000000000000000000000000000000815230600482015233602482015260448101919091526001600160a01b03909116906323b872dd90606401600060405180830381600087803b1580156122ee57600080fd5b505af1158015612302573d6000803e3d6000fd5b505050506123d6565b60016008820154600160a01b900460ff16600181111561232d5761232d612dae565b036123d6576008810154600682015460078301546040517ff242432a0000000000000000000000000000000000000000000000000000000081523060048201523360248201526044810192909252606482015260a06084820152600060a48201526001600160a01b039091169063f242432a9060c401600060405180830381600087803b1580156123bd57600080fd5b505af11580156123d1573d6000803e3d6000fd5b505050505b338787848181106123e9576123e9613586565b60018501546040516001600160a01b03909116815260209182029390930135927fbacb7225266f3381d7544a532703d91b8f97fadb38b122e13f1d951ed02a377692500160405180910390a35080612440816134d3565b915050611f7c565b5050505061116260017f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0055565b7f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0080547ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe016124f0576040517f3ee5aeb500000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60029055565b60017f9b779b17422d0df92223018b32b4d1fa46e071723d6817e2486d003becc55f0055565b604080516001600160a01b0385811660248301528416604482015260648082018490528251808303909101815260849091019091526020810180517bffffffffffffffffffffffffffffffffffffffffffffffffffffffff167f23b872dd000000000000000000000000000000000000000000000000000000001790526125a490859061292e565b50505050565b336125dc7f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300546001600160a01b031690565b6001600160a01b0316146111a7576040517f118cdaa70000000000000000000000000000000000000000000000000000000081523360048201526024016110f9565b306001600160a01b037f00000000000000000000000000000000000000000000000000000000000000001614806126b757507f00000000000000000000000000000000000000000000000000000000000000006001600160a01b03166126ab7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc546001600160a01b031690565b6001600160a01b031614155b156111a7576040517fe07c8dba00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6108986125aa565b816001600160a01b03166352d1902d6040518163ffffffff1660e01b8152600401602060405180830381865afa92505050801561276e575060408051601f3d9081017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe016820190925261276b9181019061349d565b60015b6127af576040517f4c9c8ce30000000000000000000000000000000000000000000000000000000081526001600160a01b03831660048201526024016110f9565b7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc811461280b576040517faa1d49a4000000000000000000000000000000000000000000000000000000008152600481018290526024016110f9565b61281583836129aa565b505050565b306001600160a01b037f000000000000000000000000000000000000000000000000000000000000000016146111a7576040517fe07c8dba00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b7f9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c19930080547fffffffffffffffffffffffff000000000000000000000000000000000000000081166001600160a01b03848116918217845560405192169182907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a3505050565b61290d612a00565b61089881612a67565b61291e612a00565b6111a7612a6f565b6111a7612a00565b60006129436001600160a01b03841683612a77565b9050805160001415801561296857508080602001905181019061296691906135b5565b155b15612815576040517f5274afe70000000000000000000000000000000000000000000000000000000081526001600160a01b03841660048201526024016110f9565b6129b382612a8e565b6040516001600160a01b038316907fbc7cd75a20ee27fd9adebab32041f755214dbc6bffa90cc0225b39da2e5c2d3b90600090a28051156129f8576128158282612b36565b611162612bac565b7ff0c57e16840df040f15088dc2f81fe391c3923bec73e23a9662efc9c229c6a005468010000000000000000900460ff166111a7576040517fd7e6bcf800000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6114ee612a00565b6124f6612a00565b6060612a8583836000612be4565b90505b92915050565b806001600160a01b03163b600003612add576040517f4c9c8ce30000000000000000000000000000000000000000000000000000000081526001600160a01b03821660048201526024016110f9565b7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc80547fffffffffffffffffffffffff0000000000000000000000000000000000000000166001600160a01b0392909216919091179055565b6060600080846001600160a01b031684604051612b5391906135d7565b600060405180830381855af49150503d8060008114612b8e576040519150601f19603f3d011682016040523d82523d6000602084013e612b93565b606091505b5091509150612ba3858383612c9c565b95945050505050565b34156111a7576040517fb398979f00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b606081471015612c22576040517fcd7860590000000000000000000000000000000000000000000000000000000081523060048201526024016110f9565b600080856001600160a01b03168486604051612c3e91906135d7565b60006040518083038185875af1925050503d8060008114612c7b576040519150601f19603f3d011682016040523d82523d6000602084013e612c80565b606091505b5091509150612c90868383612c9c565b925050505b9392505050565b606082612cb157612cac82612d11565b612c95565b8151158015612cc857506001600160a01b0384163b155b15612d0a576040517f9996b3150000000000000000000000000000000000000000000000000000000081526001600160a01b03851660048201526024016110f9565b5080612c95565b805115612d215780518082602001fd5b6040517f1425ea4200000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b600060208284031215612d6557600080fd5b81357fffffffff0000000000000000000000000000000000000000000000000000000081168114612c9557600080fd5b600060208284031215612da757600080fd5b5035919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602160045260246000fd5b60028110610898577f4e487b7100000000000000000000000000000000000000000000000000000000600052602160045260246000fd5b612e1d81612ddd565b9052565b8c81526001600160a01b038c811660208301528b81166040830152610180820190612e4b8c612ddd565b8b6060840152808b1660808401528960a08401528860c08401528760e08401528661010084015280861661012084015250612e8584612ddd565b836101408301528215156101608301529d9c50505050505050505050505050565b6001600160a01b038116811461089857600080fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b60008060408385031215612efd57600080fd5b8235612f0881612ea6565b9150602083013567ffffffffffffffff80821115612f2557600080fd5b818501915085601f830112612f3957600080fd5b813581811115612f4b57612f4b612ebb565b604051601f82017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0908116603f01168101908382118183101715612f9157612f91612ebb565b81604052828152886020848701011115612faa57600080fd5b8260208601602083013760006020848301015280955050505050509250929050565b600080600060608486031215612fe157600080fd5b8335612fec81612ea6565b95602085013595506040909401359392505050565b60005b8381101561301c578181015183820152602001613004565b50506000910152565b6020815260008251806020840152613044816040850160208701613001565b601f017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0169190910160400192915050565b60008083601f84011261308857600080fd5b50813567ffffffffffffffff8111156130a057600080fd5b6020830191508360208260051b85010111156130bb57600080fd5b9250929050565b60008083601f8401126130d457600080fd5b50813567ffffffffffffffff8111156130ec57600080fd5b6020830191508360208285010111156130bb57600080fd5b60008060008060008060008060a0898b03121561312057600080fd5b883561312b81612ea6565b9750602089013561313b81612ea6565b9650604089013567ffffffffffffffff8082111561315857600080fd5b6131648c838d01613076565b909850965060608b013591508082111561317d57600080fd5b6131898c838d01613076565b909650945060808b01359150808211156131a257600080fd5b506131af8b828c016130c2565b999c989b5096995094979396929594505050565b815181526020808301516101808301916131e7908401826001600160a01b03169052565b50604083015161320260408401826001600160a01b03169052565b5060608301516132156060840182612e14565b50608083015161323060808401826001600160a01b03169052565b5060a083015160a083015260c083015160c083015260e083015160e083015261010080840151818401525061012080840151613276828501826001600160a01b03169052565b50506101408084015161328b82850182612e14565b5050610160928301511515919092015290565b60008060008060008060a087890312156132b757600080fd5b86356132c281612ea6565b955060208701356132d281612ea6565b94506040870135935060608701359250608087013567ffffffffffffffff8111156132fc57600080fd5b61330889828a016130c2565b979a9699509497509295939492505050565b60006020828403121561332c57600080fd5b8135612c9581612ea6565b6002811061089857600080fd5b600080600080600080600080610100898b03121561336157600080fd5b8835975060208901359650604089013561337a81612ea6565b9550606089013561338a81613337565b9450608089013561339a81613337565b935060a08901356133aa81612ea6565b979a969950949793969295929450505060c08201359160e0013590565b600080602083850312156133da57600080fd5b823567ffffffffffffffff8111156133f157600080fd5b6133fd85828601613076565b90969095509350505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b8082028115828204841417612a8857612a88613409565b600082613485577f4e487b7100000000000000000000000000000000000000000000000000000000600052601260045260246000fd5b500490565b81810381811115612a8857612a88613409565b6000602082840312156134af57600080fd5b5051919050565b6000602082840312156134c857600080fd5b8151612c9581612ea6565b60007fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff820361350457613504613409565b5060010190565b80820180821115612a8857612a88613409565b898152602081018990526001600160a01b03888116604083015261012082019061354789612ddd565b88606084015261355688612ddd565b87608084015280871660a0840152508460c08301528360e0830152826101008301529a9950505050505050505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052603260045260246000fd5b6000602082840312156135c757600080fd5b81518015158114612c9557600080fd5b600082516135e9818460208701613001565b919091019291505056fea164736f6c6343000814000a
├─ [2791387] → new Marketplace@0x3F5B09E9Fe10Bc70fA70e1fC3FFB9834EF0BBf87
│ ├─ emit Initialized(version: 18446744073709551615 [1.844e19])
│ └─ ← 14084 bytes of code
├─ [173613] → new ERC1967Proxy@0x14Bc830f5B0b93815082cAd5bdaafAdEb41A348A
│ ├─ emit Upgraded(implementation: Marketplace: [0x3F5B09E9Fe10Bc70fA70e1fC3FFB9834EF0BBf87])
│ ├─ [119758] Marketplace::initialize(0x63d596e6b6399bbb3cFA3075968946b870045955, 10, 7776000 [7.776e6]) [delegatecall]
│ │ ├─ emit OwnershipTransferred(previousOwner: 0x0000000000000000000000000000000000000000, newOwner: 0x63d596e6b6399bbb3cFA3075968946b870045955)
│ │ ├─ emit Initialized(version: 1)
│ │ └─ ← ()
│ └─ ← 1230 bytes of code
├─ [0] console::log("UUPS Proxy Address:", ERC1967Proxy: [0x14Bc830f5B0b93815082cAd5bdaafAdEb41A348A]) [staticcall]
│ └─ ← ()
├─ [0] VM::stopBroadcast()
│ └─ ← ()
└─ ← ()

Script ran successfully.

== Logs ==
UUPS Proxy Address: 0x14Bc830f5B0b93815082cAd5bdaafAdEb41A348A

## Setting up 1 EVM.

==========================
Simulated On-chain Traces:

[2791387] → new Marketplace@0x3F5B09E9Fe10Bc70fA70e1fC3FFB9834EF0BBf87
├─ emit Initialized(version: 18446744073709551615 [1.844e19])
└─ ← 14084 bytes of code

[176113] → new ERC1967Proxy@0x14Bc830f5B0b93815082cAd5bdaafAdEb41A348A
├─ emit Upgraded(implementation: Marketplace: [0x3F5B09E9Fe10Bc70fA70e1fC3FFB9834EF0BBf87])
├─ [119758] Marketplace::initialize(0x63d596e6b6399bbb3cFA3075968946b870045955, 10, 7776000 [7.776e6]) [delegatecall]
│ ├─ emit OwnershipTransferred(previousOwner: 0x0000000000000000000000000000000000000000, newOwner: 0x63d596e6b6399bbb3cFA3075968946b870045955)
│ ├─ emit Initialized(version: 1)
│ └─ ← ()
└─ ← 1230 bytes of code

==========================

Chain 109

Estimated gas price: 3.00000003 gwei

Estimated total gas used for script: 4270634

Estimated amount required: 0.01281190212811902 ETH

==========================

###

Finding wallets for all the necessary addresses...

##

Sending transactions [0 - 1].
⠉ [00:00:00] [####################################################################################################################################################] 2/2 txes (0.0s)
Transactions saved to: /Users/iamdoraemon/Desktop/github.com/shibaone/marketplace-escrow/broadcast/Deploy.s.sol/109/run-latest.json

Sensitive values saved to: /Users/iamdoraemon/Desktop/github.com/shibaone/marketplace-escrow/cache/Deploy.s.sol/109/run-latest.json

##

Waiting for receipts.
⠙ [00:00:12] [################################################################################################################################################] 2/2 receipts (0.0s)

##### 109

✅ [Success]Hash: 0xfa391257b65c7430aa7ba36cb356f1d0d301d970c542776036f3b5a0dad92ebc
Contract Address: 0x3F5B09E9Fe10Bc70fA70e1fC3FFB9834EF0BBf87
Block: 5569732
Paid: 0.009119283045596415 ETH (3039761 gas \* 3.000000015 gwei)

##### 109

✅ [Success]Hash: 0x78673b81d9a9d9ccc1dbba4a4b35ebe9b9856a6648ec0f3741863a6cd0ad5d59
Contract Address: 0x14Bc830f5B0b93815082cAd5bdaafAdEb41A348A
Block: 5569732
Paid: 0.000738909003694545 ETH (246303 gas \* 3.000000015 gwei)

Transactions saved to: /Users/iamdoraemon/Desktop/github.com/shibaone/marketplace-escrow/broadcast/Deploy.s.sol/109/run-latest.json

Sensitive values saved to: /Users/iamdoraemon/Desktop/github.com/shibaone/marketplace-escrow/cache/Deploy.s.sol/109/run-latest.json

==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
Total Paid: 0.00985819204929096 ETH (3286064 gas \* avg 3.000000015 gwei)

##

Start verification for (2) contracts
Start verifying contract `0x3F5B09E9Fe10Bc70fA70e1fC3FFB9834EF0BBf87` deployed on 109

Submitting verification for [src/Marketplace.sol:Marketplace] 0x3F5B09E9Fe10Bc70fA70e1fC3FFB9834EF0BBf87.
Submitted contract for verification:
Response: `OK`
GUID: `3f5b09e9fe10bc70fa70e1fc3ffb9834ef0bbf87668514ea`
URL: https://www.shibariumscan.io/address/0x3f5b09e9fe10bc70fa70e1fc3ffb9834ef0bbf87
Contract verification status:
Response: `OK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
Start verifying contract `0x14Bc830f5B0b93815082cAd5bdaafAdEb41A348A` deployed on 109

Submitting verification for [lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol:ERC1967Proxy] 0x14Bc830f5B0b93815082cAd5bdaafAdEb41A348A.
Submitted contract for verification:
Response: `OK`
GUID: `14bc830f5b0b93815082cad5bdaafadeb41a348a668514fb`
URL: https://www.shibariumscan.io/address/0x14bc830f5b0b93815082cad5bdaafadeb41a348a
Contract verification status:
Response: `OK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
All (2) contracts were verified!

Transactions saved to: /Users/iamdoraemon/Desktop/github.com/shibaone/marketplace-escrow/broadcast/Deploy.s.sol/109/run-latest.json

Sensitive values saved to: /Users/iamdoraemon/Desktop/github.com/shibaone/marketplace-escrow/cache/Deploy.s.sol/109/run-latest.json

iamdoraemon@MacBook-Pro marketplace-escrow % node
Welcome to Node.js v20.11.0.
Type ".help" for more information.

> 974-699
> 275
> 557190/699
> 797.1244635193133
> \_ * 275
> 219209.22746781114
> 555000 / 950
> 584.2105263157895
> 585*950
> 555750
> 275000*2
> 550000
> 277000*2
> 554000
> 277000/975.60
> 283.92783927839275
> 285\*2
> 570
> 557000/1520
> 366.44736842105266
