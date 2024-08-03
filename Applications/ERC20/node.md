solidity
https://solidity-by-example.org/app/erc20/

#### hardhat

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
2 npx hardhat test

###### Debug with HardHat Network

1 import "hardhat/console.sol";
2 npx hardhat test

###### Deploy to Live Network

1 under ./ignition/modules directory
2 npx hardhat ignition deploy ./ignition/modules/Token.js --network <network-name>
