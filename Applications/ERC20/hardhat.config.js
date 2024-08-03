const { vars } = require("hardhat/config");

require("@nomicfoundation/hardhat-toolbox");
const GANACHE_PRIVATE_KEY_0 = vars.get("GANACHE_PRIVATE_KEY_0");
const SEPOLIA_PRIVATE_KEY_0 = vars.get("SEPOLIA_PRIVATE_KEY_0");
const INFURA_KEY = vars.get("INFURA_KEY");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",

  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [GANACHE_PRIVATE_KEY_0],
    },
    sepolia: {
      url: `https://sepolia.infura.io/v3/${INFURA_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY_0],
    },
  },
};
