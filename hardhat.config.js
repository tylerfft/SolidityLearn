const { vars } = require("hardhat/config");

require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");
require("solidity-coverage");
require("./tasks/first");

const GANACHE_PRIVATE_KEY_0 = vars.get("GANACHE_PRIVATE_KEY_0");
const SEPOLIA_PRIVATE_KEY_0 = vars.get("SEPOLIA_PRIVATE_KEY_0");
const SEPOLIA_ETHERSCAN_API_KEY = vars.get("SEPOLIA_ETHERSCAN_API_KEY");
const COINMARKETCAP_API_KEY = vars.get("COINMARKETCAP_API_KEY");
const INFURA_KEY = vars.get("INFURA_KEY");
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",

  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [GANACHE_PRIVATE_KEY_0],
      chainId: 1337,
    },
    sepolia: {
      url: `https://sepolia.infura.io/v3/${INFURA_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY_0],
      chainId: 11155111,
    },
  },
  etherscan: {
    apiKey: {
      mainnet: SEPOLIA_ETHERSCAN_API_KEY,
      sepolia: SEPOLIA_ETHERSCAN_API_KEY,
    },

    // customChains: [
    //   {
    //     network: "sepolia",
    //     chainId: 11155111,
    //     urls: {
    //       apiURL: "https://api-sepolia.etherscan.io/api",
    //       browserURL: "https://sepolia.etherscan.io",
    //     },
    //   },
    // ],
  },
  sourcify: {
    enabled: true,
    // Optional: specify a different Sourcify server
    apiUrl: "https://sourcify.dev/server",
    // Optional: specify a different Sourcify repository
    browserUrl: "https://repo.sourcify.dev",
  },
  gasReporter: {
    enabled: true,
    outputFile: "gas-report.txt",
    noColors: true,
    currency: "USD",
    gasPriceApi:
      "https://api-sepolia.etherscan.io/api?module=proxy&action=eth_gasPrice",
    coinmarketcap: `${COINMARKETCAP_API_KEY}`,
  },
};
