const main = async () => {
  const domainContractFactory = await hre.ethers.getContractFactory("Wallet");
  const domainContract = await domainContractFactory.deploy();
  await domainContract.deployed();

  console.log(`Contract deployed to: ${domainContract.address}`);

  let txn = await domainContract.deposit();
  await txn.wait();

  const balance = await domainContract.getBalance();
  console.log("balance:", balance);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (err) {
    console.log(err);
    process.exit(1);
  }
};

runMain();
