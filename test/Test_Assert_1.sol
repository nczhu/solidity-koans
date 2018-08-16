pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol"; // This gets the address of test contract instance
import "../contracts/Assert_1.sol";

contract Test_Assert_1 {
  beforeAll()
  
  Assert_1 instance = Assert_1(DeployedAddresses.Assert_1());

  function testShouldReturnTrue() public {
    bool actual = instance.returnTrue();
    Assert.isTrue(actual, "returnTrue() should return true");
  }

  function testShouldReturnFalse() public {
    bool actual = instance.returnFalse();
    Assert.isFalse(actual, "returnFalse() should return false");
  }
}