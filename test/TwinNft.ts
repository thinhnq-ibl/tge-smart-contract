import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import hre from "hardhat";

describe("TwinNft", function () {
  async function deployFixture() {
    const TwinNft = await hre.ethers.getContractFactory("TwinNft");
    const twinNft = await hre.upgrades.deployProxy(
      TwinNft,
      ["TwinNft", "TNFT"],
      { initializer: "initialize" }
    );

    return { twinNft };
  }

  it("Should get loan fund at over 80% pool", async function () {
    const { twinNft } = await loadFixture(deployFixture);
  });
});
