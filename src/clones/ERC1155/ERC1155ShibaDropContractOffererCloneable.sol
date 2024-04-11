// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {
    IERC1155ShibaDrop
} from "../../interfaces/ERC1155/IERC1155ShibaDrop.sol";

import { IShibaDropToken } from "../../interfaces/ERC1155/IShibaDropToken.sol";

import {
    ERC1155ContractMetadataCloneable
} from "./ERC1155ContractMetadataCloneable.sol";

import {
    ERC1155ShibaDropContractOffererStorage
} from "../../lib/ERC1155/ERC1155ShibaDropContractOffererStorage.sol";

import {
    ERC1155ShibaDropErrorsAndEvents
} from "../../lib/ERC1155/ERC1155ShibaDropErrorsAndEvents.sol";

import { PublicDrop } from "../../lib/ERC1155/ERC1155ShibaDropStructs.sol";

import { AllowListData } from "../../lib/ERC1155/ShibaDropStructs.sol";

import {
    ERC1155ConduitPreapproved
} from "../../lib/ERC1155/ERC1155ConduitPreapproved.sol";

import { ERC1155 } from "../../solady/tokens/ERC1155.sol";

import { SpentItem } from "../../shibaport-types/lib/ConsiderationStructs.sol";

import {
    ContractOffererInterface
} from "../../shibaport-types/interfaces/ContractOffererInterface.sol";

import {
    IERC165
} from "openzeppelin-contracts/utils/introspection/IERC165.sol";

/**
 * @title  ERC1155ShibaDropContractOffererCloneable
 * @author James Wenzel (emo.eth)
 * @author Ryan Ghods (ralxz.eth)
 * @author Stephan Min (stephanm.eth)
 * @author Michael Cohen (notmichael.eth)
 * @notice A cloneable ERC1155 token contract that can mint as a
 *         Shibaport contract offerer.
 */
contract ERC1155ShibaDropContractOffererCloneable is
    ERC1155ContractMetadataCloneable,
    ERC1155ShibaDropErrorsAndEvents
{
    using ERC1155ShibaDropContractOffererStorage for ERC1155ShibaDropContractOffererStorage.Layout;

    /**
     * @notice Initialize the token contract.
     *
     * @param allowedConfigurer The address of the contract allowed to
     *                          configure parameters. Also contains SeaDrop
     *                          implementation code.
     * @param allowedShibaport    The address of the Shibaport contract allowed to
     *                          interact.
     * @param name_             The name of the token.
     * @param symbol_           The symbol of the token.
     */
    function __ERC1155SeaDropContractOffererCloneable_init(
        address allowedConfigurer,
        address allowedShibaport,
        string memory name_,
        string memory symbol_
    ) internal onlyInitializing {
        // Set the allowed Shibaport to interact with this contract.
        if (allowedShibaport == address(0)) {
            revert AllowedSeaportCannotBeZeroAddress();
        }
        ERC1155ShibaDropContractOffererStorage.layout()._allowedShibaport[
                allowedShibaport
            ] = true;

        // Set the allowed Shibaport enumeration.
        address[] memory enumeratedAllowedSeaport = new address[](1);
        enumeratedAllowedSeaport[0] = allowedShibaport;
        ERC1155ShibaDropContractOffererStorage
            .layout()
            ._enumeratedAllowedShibaport = enumeratedAllowedSeaport;

        // Emit an event noting the contract deployment.
        emit ShibaDropTokenDeployed(SEADROP_TOKEN_TYPE.ERC1155_CLONE);

        // Initialize ERC1155ContractMetadataCloneable.
        __ERC1155ContractMetadataCloneable_init(
            allowedConfigurer,
            name_,
            symbol_
        );
    }

    /**
     * @notice The fallback function is used as a dispatcher for SeaDrop
     *         methods.
     */
    fallback(bytes calldata) external returns (bytes memory output) {
        // Get the function selector.
        bytes4 selector = msg.sig;

        // Get the rest of the msg data after the selector.
        bytes calldata data = msg.data[4:];

        // Determine if we should forward the call to the implementation
        // contract with SeaDrop logic.
        bool callSeaDropImplementation = selector ==
            IShibaDropToken.updateAllowedSeaport.selector ||
            selector == IShibaDropToken.updateDropURI.selector ||
            selector == IShibaDropToken.updateAllowList.selector ||
            selector == IShibaDropToken.updateCreatorPayouts.selector ||
            selector == IShibaDropToken.updatePayer.selector ||
            selector == IShibaDropToken.updateAllowedFeeRecipient.selector ||
            selector == IShibaDropToken.updateSigner.selector ||
            selector == IERC1155ShibaDrop.updatePublicDrop.selector ||
            selector == ContractOffererInterface.previewOrder.selector ||
            selector == ContractOffererInterface.generateOrder.selector ||
            selector == ContractOffererInterface.getSeaportMetadata.selector ||
            selector == IERC1155ShibaDrop.getPublicDrop.selector ||
            selector == IERC1155ShibaDrop.getPublicDropIndexes.selector ||
            selector == IShibaDropToken.getAllowedSeaport.selector ||
            selector == IShibaDropToken.getCreatorPayouts.selector ||
            selector == IShibaDropToken.getAllowListMerkleRoot.selector ||
            selector == IShibaDropToken.getAllowedFeeRecipients.selector ||
            selector == IShibaDropToken.getSigners.selector ||
            selector == IShibaDropToken.getDigestIsUsed.selector ||
            selector == IShibaDropToken.getPayers.selector;

        // Determine if we should require only the owner or configurer calling.
        bool requireOnlyOwnerOrConfigurer = selector ==
            IShibaDropToken.updateAllowedSeaport.selector ||
            selector == IShibaDropToken.updateDropURI.selector ||
            selector == IShibaDropToken.updateAllowList.selector ||
            selector == IShibaDropToken.updateCreatorPayouts.selector ||
            selector == IShibaDropToken.updatePayer.selector ||
            selector == IShibaDropToken.updateAllowedFeeRecipient.selector ||
            selector == IERC1155ShibaDrop.updatePublicDrop.selector;

        if (callSeaDropImplementation) {
            // For update calls, ensure the sender is only the owner
            // or configurer contract.
            if (requireOnlyOwnerOrConfigurer) {
                _onlyOwnerOrConfigurer();
            } else if (selector == IShibaDropToken.updateSigner.selector) {
                // For updateSigner, a signer can disallow themselves.
                // Get the signer parameter.
                address signer = address(bytes20(data[12:32]));
                // If the signer is not allowed, ensure sender is only owner
                // or configurer.
                if (
                    msg.sender != signer ||
                    (msg.sender == signer &&
                        !ERC1155ShibaDropContractOffererStorage
                            .layout()
                            ._allowedSigners[signer])
                ) {
                    _onlyOwnerOrConfigurer();
                }
            }

            // Forward the call to the implementation contract.
            (bool success, bytes memory returnedData) = _CONFIGURER
                .delegatecall(msg.data);

            // Require that the call was successful.
            if (!success) {
                // Bubble up the revert reason.
                assembly {
                    revert(add(32, returnedData), mload(returnedData))
                }
            }

            // If the call was to generateOrder, mint the tokens.
            if (selector == ContractOffererInterface.generateOrder.selector) {
                _mintOrder(data);
            }

            // Return the data from the delegate call.
            return returnedData;
        } else if (selector == IERC1155ShibaDrop.getMintStats.selector) {
            // Get the minter and token id.
            (address minter, uint256 tokenId) = abi.decode(
                data,
                (address, uint256)
            );

            // Get the mint stats.
            (
                uint256 minterNumMinted,
                uint256 minterNumMintedForTokenId,
                uint256 totalMintedForTokenId,
                uint256 maxSupply
            ) = _getMintStats(minter, tokenId);

            // Encode the return data.
            return
                abi.encode(
                    minterNumMinted,
                    minterNumMintedForTokenId,
                    totalMintedForTokenId,
                    maxSupply
                );
        } else if (selector == ContractOffererInterface.ratifyOrder.selector) {
            // This function is a no-op, nothing additional needs to happen here.
            // Utilize assembly to efficiently return the ratifyOrder magic value.
            assembly {
                mstore(0, 0xf4dd92ce)
                return(0x1c, 32)
            }
        } else if (selector == IShibaDropToken.configurer.selector) {
            // Return the configurer contract.
            return abi.encode(_CONFIGURER);
        } else if (selector == IERC1155ShibaDrop.multiConfigureMint.selector) {
            // Ensure only the owner or configurer can call this function.
            _onlyOwnerOrConfigurer();

            // Mint the tokens.
            _multiConfigureMint(data);
        } else {
            // Revert if the function selector is not supported.
            revert UnsupportedFunctionSelector(selector);
        }
    }

    /**
     * @notice Returns a set of mint stats for the address.
     *         This assists in enforcing maxSupply, maxTotalMintableByWallet,
     *         and maxTokenSupplyForStage checks.
     *
     * @dev    NOTE: Implementing contracts should always update these numbers
     *         before transferring any tokens with _safeMint() to mitigate
     *         consequences of malicious onERC1155Received() hooks.
     *
     * @param minter  The minter address.
     * @param tokenId The token id to return the stats for.
     */
    function _getMintStats(address minter, uint256 tokenId)
        internal
        view
        returns (
            uint256 minterNumMinted,
            uint256 minterNumMintedForTokenId,
            uint256 totalMintedForTokenId,
            uint256 maxSupply
        )
    {
        // Put the token supply on the stack.
        TokenSupply storage tokenSupply = _tokenSupply[tokenId];

        // Assign the return values.
        totalMintedForTokenId = tokenSupply.totalMinted;
        maxSupply = tokenSupply.maxSupply;
        minterNumMinted = _totalMintedByUser[minter];
        minterNumMintedForTokenId = _totalMintedByUserPerToken[minter][tokenId];
    }

    /**
     * @dev Handle ERC-1155 safeTransferFrom. If "from" is this contract,
     *      the sender can only be Shibaport or the conduit.
     *
     * @param from   The address to transfer from.
     * @param to     The address to transfer to.
     * @param id     The token id to transfer.
     * @param amount The amount of tokens to transfer.
     * @param data   The data to pass to the onERC1155Received hook.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) public virtual override {
        if (from == address(this)) {
            // Only Shibaport or the conduit can use this function
            // when "from" is this contract.
            if (
                msg.sender != _CONDUIT &&
                !ERC1155ShibaDropContractOffererStorage
                    .layout()
                    ._allowedShibaport[msg.sender]
            ) {
                revert InvalidCallerOnlyAllowedSeaport(msg.sender);
            }
            return;
        }

        ERC1155._safeTransfer(_by(), from, to, id, amount, data);
    }

    /**
     * @notice Returns whether the interface is supported.
     *
     * @param interfaceId The interface id to check against.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC1155ContractMetadataCloneable)
        returns (bool)
    {
        return
            interfaceId == type(IERC1155ShibaDrop).interfaceId ||
            interfaceId == type(ContractOffererInterface).interfaceId ||
            interfaceId == 0x2e778efc || // SIP-5 (getSeaportMetadata)
            // ERC1155ContractMetadata returns supportsInterface true for
            //     IERC1155ContractMetadata, ERC-4906, ERC-2981
            // ERC1155A returns supportsInterface true for
            //     ERC165, ERC1155, ERC1155MetadataURI
            ERC1155ContractMetadataCloneable.supportsInterface(interfaceId);
    }

    /**
     * @dev Internal function to mint tokens during a generateOrder call
     *      from Shibaport.
     *
     * @param data The original transaction calldata, without the selector.
     */
    function _mintOrder(bytes calldata data) internal {
        // Decode fulfiller, minimumReceived, and context from calldata.
        (
            address fulfiller,
            SpentItem[] memory minimumReceived,
            ,
            bytes memory context
        ) = abi.decode(data, (address, SpentItem[], SpentItem[], bytes));

        // Assign the minter from context[22:42]. We validate context has the
        // correct minimum length in the implementation's `_decodeOrder`.
        address minter;
        assembly {
            minter := shr(96, mload(add(add(context, 0x20), 22)))
        }

        // If the minter is the zero address, set it to the fulfiller.
        if (minter == address(0)) {
            minter = fulfiller;
        }

        // Set the token ids and quantities.
        uint256 minimumReceivedLength = minimumReceived.length;
        uint256[] memory tokenIds = new uint256[](minimumReceivedLength);
        uint256[] memory quantities = new uint256[](minimumReceivedLength);
        for (uint256 i = 0; i < minimumReceivedLength; ) {
            tokenIds[i] = minimumReceived[i].identifier;
            quantities[i] = minimumReceived[i].amount;
            unchecked {
                ++i;
            }
        }

        // Mint the tokens.
        _batchMint(minter, tokenIds, quantities, "");
    }

    /**
     * @dev Internal function to mint tokens during a multiConfigureMint call
     *      from the configurer contract.
     *
     * @param data The original transaction calldata, without the selector.
     */
    function _multiConfigureMint(bytes calldata data) internal {
        // Decode the calldata.
        (
            address recipient,
            uint256[] memory tokenIds,
            uint256[] memory amounts
        ) = abi.decode(data, (address, uint256[], uint256[]));

        _batchMint(recipient, tokenIds, amounts, "");
    }
}
