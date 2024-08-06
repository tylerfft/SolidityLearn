const TokenModule = require("../ignition/modules/Token");

async function main() {
  const { token } = await hre.ignition.deploy(TokenModule);
  console.log(`token deployed to: ${await token.getAddress()}`);
}

main().catch(console.error);
