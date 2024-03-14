// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Signer, IERC20} from "../src/Signing.sol";

contract SigningTest is Test {
    Signer public signer;
    IERC20 token = IERC20(address(4));
    uint256 operatorPrivateKey = vm.envUint("PK"); 
    address operator = vm.addr(operatorPrivateKey);

    function setUp() public {
        signer = new Signer();
    }

    function test_Sign() public {
        vm.startPrank(operator);
        
        Signer.Claim memory claim = Signer.Claim(
            token,
            1e18
        );

        bytes32 _hash = signer.hash(claim);

        console.log("\nhash: ");
        console.logBytes32(_hash);

        bytes32 typedHash = signer.getTypedHash(claim);

        console.log("\ntyped hash: ");
        console.logBytes32(typedHash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(operatorPrivateKey, typedHash);
        bytes memory sign = abi.encodePacked(r, s, v);

        console.log("\nsign: ");
        console.logBytes(sign);

        assert(signer.verifySignature(operator, typedHash, sign) == true);
        
        vm.stopPrank();
    }
}
