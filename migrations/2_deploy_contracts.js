var Assert_1 = artifacts.require("Assert_1");
var Assert = artifacts.require("Assert");

module.exports = function(deployer) {
  deployer.deploy(Assert_1);
  deployer.deploy(Assert);
  // deployer.deploy(Integer_2);

  // Deploy more here
};