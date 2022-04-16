/* hardhat.config.js */
require("@nomiclabs/hardhat-waffle")
const fs = require('fs')
const privateKey = fs.readFileSync(".secret").toString().trim() || "01234567890123456789"

module.exports = {
  defaultNetwork: "optimism-local",
  networks: {
    // for mainnet
    'optimism': {
      url: "https://mainnet.optimism.io",
      accounts: [privateKey]
    },
    // for testnet
    'optimism-kovan': {
      url: "https://kovan.optimism.io",
      // accounts: [privateKey1, privateKey2, ...]
    },
    // for the local dev environment
    'optimism-local': {
      url: "http://localhost:8545",
      accounts: [privateKey]
    },
    hardhat: {
      chainId: 1337
    },
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}