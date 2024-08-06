const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
// const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Swap contract", function () {
  async function deployAliceCoinAndBobCoin() {
    const [, Alice, Bob] = await ethers.getSigners();

    const MyToken = await ethers.getContractFactory("MyToken");
    const AliceCoin = await MyToken.deploy("AliceCoin", "ALC", 18);
    const BobCoin = await MyToken.deploy("BobCoin", "BLC", 18);

    await AliceCoin.transfer(Alice.address, 10);
    await BobCoin.transfer(Bob.address, 20);

    return { AliceCoin, Alice, BobCoin, Bob };
  }

  describe("Alice Amount Assert1", function () {
    it("Alice Amount Assert1", async function () {
      const { AliceCoin, Alice } = await loadFixture(deployAliceCoinAndBobCoin);
      expect(await AliceCoin.balanceOf(Alice.address)).to.equal(10);
    });
  });

  describe("Bob Amount Assert1", function () {
    it("Bob Amount Assert2", async function () {
      const { BobCoin, Bob } = await loadFixture(deployAliceCoinAndBobCoin);
      expect(await BobCoin.balanceOf(Bob.address)).to.equal(20);
    });
  });

  describe("Trasfer", function () {
    it("Transfer", async function () {
      const { AliceCoin, Alice, BobCoin, Bob } = await loadFixture(
        deployAliceCoinAndBobCoin
      );

      const TokenSwap = await ethers.getContractFactory("TokenSwap");
      const tokenSwap = await TokenSwap.deploy(
        AliceCoin,
        Alice,
        3,
        BobCoin,
        Bob,
        7
      );

      await AliceCoin.connect(Alice).approve(tokenSwap, 3);
      await BobCoin.connect(Bob).approve(tokenSwap, 7);

      await tokenSwap.connect(Alice).swap();

      expect(await AliceCoin.balanceOf(Alice.address)).to.equal(7);
      expect(await AliceCoin.balanceOf(Bob.address)).to.equal(3);
      expect(await BobCoin.balanceOf(Alice.address)).to.equal(7);
      expect(await BobCoin.balanceOf(Bob.address)).to.equal(13);
    });
  });
});
