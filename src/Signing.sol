// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {ECDSA, EIP712} from "openzeppelin/utils/cryptography/EIP712.sol";
import "openzeppelin/interfaces/IERC20.sol";

contract Signer is EIP712{
    
    struct Claim {
        IERC20 token;
        uint256 amount;
    }

    bytes32 public constant TYPE_HASH =
    keccak256(
        "Claim("
        "IERC20 token,"
        "uint256 amount"
        ")"
    );

    constructor(
    ) EIP712("TEST", "v1") {
    }

    function hash(Claim calldata claim) public pure returns (bytes32) {
        return (
            keccak256(
                abi.encode(
                    TYPE_HASH,
                    claim.token,
                    claim.amount
                )
            )
        );
    }

    function getTypedHash(
        Claim calldata claim
    ) public view returns (bytes32 _hash) {
        _hash = _hashTypedDataV4(hash(claim));
    }

    function verifySignature(
        address sender,
        bytes32 typedHash,
        bytes memory signature
    ) public pure returns (bool) {

        address signer = ECDSA.recover(typedHash, signature);
        return signer == sender;
        
    }

}