import "dotenv/config";
import { Contract, JsonRpcProvider, Wallet } from "ethers";
import { abi } from "./abi/abi";

const provider = new JsonRpcProvider(process.env.RPC_URL);
const wallet = new Wallet(process.env.PK as string, provider);
const contract_address = "0xb6CF871dA4b22969fA1C63Bd42486BEEE3EeA3C2"
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

})();