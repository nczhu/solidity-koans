var Assert_1 = artifacts.require("Assert_1");
var Integer_2 = artifacts.require("Integer_2");

module.exports = function(deployer) {
  deployer.deploy(Assert_1);
  deployer.deploy(Integer_2);

  // Deploy more here
};