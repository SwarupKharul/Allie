const hre = require("hardhat");
const fs = require('fs');

async function main() {

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


    let config = `
  export const mydepotaddress = ""
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
