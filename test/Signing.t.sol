// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Signer, IERC20} from "../src/Signing.sol";

contract SigningTest is Test {
    Signer public signer;
    IERC20 token = IERC20(0x779877A7B0D9E8603169DdbD7836e478b4624789);
    uint256 operatorPrivateKey = vm.envUint("PK"); 
    address operator = vm.addr(operatorPrivateKey);

    function setUp() public {
        // signer = new Signer();
        vm.createSelectFork(vm.envString("RPC_URL"));
        signer = Signer(0xA75547A78F27642216525B6edac07452ec2A88f3);
    }

    function test_Sign() public {
        vm.startPrank(operator);
        
        Signer.Claim memory claim = Signer.Claim(
            token,
            1e18
        );

        console.log("\ndomain: ");
        console.logBytes32(signer.DOMAIN_SEPARATOR());

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

        assert(signer.verifySignature(operator, claim, sign) == true);
        
        vm.stopPrank();
    }
}
