var Assert_1 = artifacts.require("Assert_1");
var Nil_2 = artifacts.require("Nil_2");

module.exports = function(deployer) {
  deployer.deploy(Assert_1);
  deployer.deploy(Nil_2);

  // Deploy more here
};