const hre = require("hardhat");
const fs = require('fs');

async function main() {
    const MyContract = await hre.ethers.getContractFactory("MyDepot");
    const mydepot = await MyContract.deploy();
    await mydepot.deployed();
    console.log("myDepot deployed to:", mydepot.address);

    // for MyReward
    const MyReward = await hre.ethers.getContractFactory("MyReward");
    const myreward = await MyReward.deploy();
    await myreward.deployed();
    console.log("myReward deployed to:", myreward.address);

    // for MyStake
    const MyStake = await hre.ethers.getContractFactory("MyStake");
    const mystake = await MyStake.deploy();
    await mystake.deployed();
    console.log("myStake deployed to:", mystake.address);

    // for MyUnstake
    const MyUnstake = await hre.ethers.getContractFactory("MyUnstake");
    const myunstake = await MyUnstake.deploy();
    await myunstake.deployed();
    console.log("myUnstake deployed to:", myunstake.address);

    let config = `
  export const mydepotaddress = "${mydepot.address}"
  `

    let data = JSON.stringify(config)
    fs.writeFileSync('config.js', JSON.parse(data))

}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
