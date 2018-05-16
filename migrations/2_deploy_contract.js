var FakToken = artifacts.require("./FakToken.sol");

module.exports = function(deployer) {
  deployer.deploy(FakToken);
};
