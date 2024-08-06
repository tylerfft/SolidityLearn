solidity
https://solidity-by-example.org/app/erc20/

#### HardHat

https://hardhat.org/tutorial/setting-up-the-environment

###### Setting up environment

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 22
nvm use 22
nvm alias default 22
npm install npm --global # Upgrade npm to the latest version

###### Create new project

mkdir project-dir
cd project-dir
npm init
npm install --save-dev hardhat
npx hardhat init
npm install --save-dev @nomicfoundation/hardhat-toolbox

###### Writing contracts

1 under './contracts' directory
2 npx hardhat compile

###### Testing contracts

1 under './test' directory
2 npx hardhat test.

###### Debug with HardHat Network

1 import "hardhat/console.sol";
2 npx hardhat test

###### Deploy to a Live Network

1 under ./ignition/modules directory
2 npx hardhat ignition deploy ./ignition/modules/Token.js --network `<network-name>`

npx hardhat vars set GANACHE_PRIVATE_KEY_0

#### Plugins

###### verify

```js
  etherscan: {
    apiKey: {
      mainnet: `${SEPOLIA_ETHERSCAN_API_KEY}`,
      sepolia: `${SEPOLIA_ETHERSCAN_API_KEY}`,
    },
    customChains: [
      {
        network: "sepolia",
        chainId: 11155111,
        urls: {
          apiURL: "https://api-sepolia.etherscan.io/api",
          browserURL: "https://sepolia.etherscan.io",
        },
      },
    ],
  },
  sourcify: {
    enabled: true,
    // Optional: specify a different Sourcify server
    apiUrl: "https://sourcify.dev/server",
    // Optional: specify a different Sourcify repository
    browserUrl: "https://repo.sourcify.dev",
  },
```

npx hardhat verify --network mainnet DEPLOYED_CONTRACT_ADDRESS

npx hardhat verify --network sepolia 0x2C2D89060a62585115c6F9170318Cc1185Eb2A89

npm install --global hardhat-shorthand

hardhat-completion install

hardhat console --network <>

let token = await ethers.getContractAt("Token","0xf9f1d401359952a1882c55577409600538ba11f1");

#### test

###### hardhat-gas-reporter

npm i hardhat-gas-reporter --save-dev

```
gasReporter: {
    enabled: true,
  },
```

###### solidity-coverage

```
require("solidity-coverage");

hh coverage

```
