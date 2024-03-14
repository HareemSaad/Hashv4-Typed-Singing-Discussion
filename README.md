## run foundry test
```bash
forge test -vv
```

## deploy
```bash
source .env
forge script script/Deploy.s.sol --rpc-url $RPC_URL --broadcast -vvv --verify --watch
```