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
const snxjs = synthetix({ network: 'mainnet' });
let getSupply = async () => {
    const { formatEther } = snxjs.utils;

    const synths = snxjs.synths.map(({ name }) => name);
    const fromBlock = 10260987;
    const blockOptions = fromBlock ? { blockTag: Number(fromBlock) } : {};

    let totalInUSD = 0;

    const unformattedSnxPrice = await snxjs.contracts.ExchangeRates.rateForCurrency(
        snxjs.toBytes32('SNX'),
        {
            blockTag: 12e6,
        }
    ); // note blockOptions must be passed to `ethers.Contract` as the final parameter (and fails if no archive node)
    const snxPrice = formatEther(unformattedSnxPrice);
    console.log('snxPrice', snxPrice);
    synths.map(async (synth, index) => {
        const totalAmount = await snxjs.contracts[`Synth${synth}`].totalSupply(blockOptions);

        const totalSupply = formatEther(totalAmount);
        // console.log('synth', synth);
        // console.log('totalSupply', totalSupply);
        const rateForSynth = formatEther(
            await snxjs.contracts.ExchangeRates.rateForCurrency(snxjs.toBytes32(synth), blockOptions).catch(e => {
                console.log('error', e);
            })
        );
        const totalSupplyInUSD = rateForSynth * totalSupply;
        totalInUSD += totalSupplyInUSD;
        if (index === synths.length - 1) {
            console.log('totalInUSD', totalInUSD);
        }

        const rateIsFrozen = await snxjs.contracts.ExchangeRates.rateIsFrozen(
            snxjs.toBytes32(synth),
            blockOptions
        );

        return { synth, totalAmount, totalSupply, rateForSynth, totalSupplyInUSD, rateIsFrozen };
    });
    console.log("synths: ", synths);
}
getSupply();