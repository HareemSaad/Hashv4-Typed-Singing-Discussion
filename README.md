## run foundry test
```bash
forge test -vv
```

## deploy
```bash
source .env
forge script script/Deploy.s.sol --rpc-url $RPC_URL --broadcast -vvv --verify --watch
```
## run ethers js script
```bash
cd ts-scripts/
ts-node index.ts
```

## signing with foundry 
```
domain: 
  0x51883c983e9fe113bf17a74e5f4e8cfcbda5d5d52bfd0802c6dca47350181174
  
hash: 
  0xc596e9295b7be10f59d0d46b0190f6b94c8ebd68bc72657648a680b35b615fee
  
typed hash: 
  0x4364201bf46418563365becefa4e53937f9dada4c89222f2f4a22cc69d3e2e97
  
sign: 
  0x5715f48ce4ba8a5559a48ea351f572c3cf6d092b4bc38772f5082bcd1ad51704446df733a95e3756a6bb75646840874d85ed6b072ccf37a4dbd58c9445c0402e1c

```

## signing with ethers js
```
domain:  0x51883c983e9fe113bf17a74e5f4e8cfcbda5d5d52bfd0802c6dca47350181174
hash:  0xaf4c91a70edbe73252240345eb6e1c1c24f6461952a62f3a1d0e48de947c461b
typed hash:  0x4af1d360c22d329f77026217e6a39fc8ecabd777a92bcea97eed968372e925b9
sign: 0x2c50127278afc43dd9e1a5043ba89ea123454cb4393d8a6c3f75761cbd14e1a81751cdeda56985a2d09fc97c71ed84e73fcec02bfa38abd5cff7dcc3eef3bd2e1b
```