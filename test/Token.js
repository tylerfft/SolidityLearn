const { expect } = require("chai");

describe("Token contract", function () {
  let owner, addr1, addr2;
  let hardhatToken;
  this.beforeEach(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();
    hardhatToken = await ethers.deployContract("Token");
  });
  // ...previous test...

  it("Should transfer tokens between accounts", async function () {
    // Transfer 50 tokens from owner to addr1
    await hardhatToken.transfer(addr1.address, 50);
    expect(await hardhatToken.balanceOf(addr1.address)).to.equal(50);

    // Transfer 50 tokens from addr1 to addr2
    await hardhatToken.connect(addr1).transfer(addr2.address, 50);
    expect(await hardhatToken.balanceOf(addr2.address)).to.equal(50);
  });
});
