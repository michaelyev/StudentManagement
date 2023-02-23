require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.0",
  networks: {
    goerli: {
      url: 'https://eth-goerli.g.alchemy.com/v2/GEHVW6KJpBVf_jTtlQT8Pv1s06RRJrzj',
      accounts: ['5756045ca665fe768eec4e0aa27217abde7c234c53156ceb1697ad282f219871'],
    },
  }
};