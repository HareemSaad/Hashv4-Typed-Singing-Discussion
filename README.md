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
  0x120351d38928dbc81fa967a5e3defc30c7478b6d04ba5e579bdeeb44a6af817b
  
hash: 
  0xc596e9295b7be10f59d0d46b0190f6b94c8ebd68bc72657648a680b35b615fee
  
typed hash: 
  0xf8e19316e76dc3fecd2aeec7825819af1095b3750b6d614074b9e1ca31e00c0d
  
sign: 
  0x659f6c67cce30a88fb4372b9b6c71b9b2b41e1e91ddb7bbdd6a7ae04ea77c24a1c3a1628804d5a6fb24b01fd21683ce0235663572293eee9f29f672582460a891c


```

## signing with ethers js
```
domain:  0x120351d38928dbc81fa967a5e3defc30c7478b6d04ba5e579bdeeb44a6af817b
hash:  0xaf4c91a70edbe73252240345eb6e1c1c24f6461952a62f3a1d0e48de947c461b
typed hash:  0xdf1bc6403f3fe3bbcec58c27815b467f55bc3751d0cbd5d3b8529957e5d375ba
sign: 0x94e29f7c242dd3bb32c5434a7677d09f024dfdbc7bb3bdc42e26e2286741ca481025609c44b002824e891493ae79aee74da9ae6ec543297df2948c34d4c9d1f51b
```