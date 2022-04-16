const { ethers } = require("ethers");
// import synthetix
const { synthetix } = require('@synthetixio/contracts-interface');

// any old provider will do
const provider = ethers.providers.getDefaultProvider('kovan');

// create a signer with a provider attached
const signer = new ethers.Wallet(
    // just a dummy kovan wallet with a little keth from the faucet
    '0xa0d951c494421559c63089093b020cf2f7aac003c916967dc36e989bc695222e',
    provider
);

// and then instantiate synthetix with the signer
const snxjs = synthetix({ network: 'mainnet', signer });

let minter = async () => {

    // mint 0.01 sETH via the NativeEtherWrapper
    const response = await snxjs.contracts.NativeEtherWrapper.mint({
        value: ethers.utils.parseEther('0.01'),
        gasPrice: ethers.utils.parseUnits('5', 'gwei'),
        gasLimit: 500e3,
    });
    console.log('Submitted', response.hash);
    await response.wait();
    console.log('Mined', `https://etherscan.io/tx/${response.hash}`);
}

module.exports = minter;