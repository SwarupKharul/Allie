const { SynthetixJs } = require('synthetix-js');
const snxjs = new SynthetixJs(); //uses default ContractSettings - ethers.js default provider, mainnet
let totalSupply = async () => {
    const totalSUSD = await snxjs.sUSD.totalSupply();
    const totalSUSDSupply = snxjs.utils.formatEther(totalSUSD);
    console.log('sUSDTotalSupply', totalSUSDSupply);


    const totalSETH = await snxjs.sETH.totalSupply();
    const totalSETHSupply = snxjs.utils.formatEther(totalSETH);
    console.log('totalSETHSupply', totalSETHSupply);


    const totalSBTC = await snxjs.sBTC.totalSupply();
    const totalSBTCSupply = snxjs.utils.formatEther(totalSBTC);
    console.log('totalSBTCSupply', totalSBTCSupply);


    const totalSAUD = await snxjs.sAUD.totalSupply();
    const totalSAUDSupply = snxjs.utils.formatEther(totalSAUD);
    console.log('totalSAUDSupply', totalSAUDSupply);

    return {
        totalSUSDSupply,
        totalSBTCSupply,
        totalSAUDSupply,
        totalSETHSupply
    }
};

module.exports = totalSupply;