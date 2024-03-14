import "dotenv/config";
import { Contract, JsonRpcProvider, Wallet, assert } from "ethers";
import { abi } from "./abi/abi";

const provider = new JsonRpcProvider(process.env.RPC_URL);
const wallet = new Wallet(process.env.PK as string, provider);
const contract_address = "0xA75547A78F27642216525B6edac07452ec2A88f3"
const contract = new Contract(
    contract_address,
    abi,
    wallet
);

(async function () {

    const domain = {
        name: "TEST",
        version: 'v1',
        chainId: 11155111,
        verifyingContract: contract_address
    };

    const types = {
        Order: [
          { name: 'token', type: 'address' },
          { name: 'amount', type: 'uint256' }
        ]
    };

    const claim = {
        token: "0x779877A7B0D9E8603169DdbD7836e478b4624789",
        amount: "100"
    } 
    
    const sig = await wallet.signTypedData(domain, types, claim);

    console.log(sig);

    const result = await contract.verifySignature(
        wallet.address,
        claim,
        sig
    );

    console.log(result)

})();