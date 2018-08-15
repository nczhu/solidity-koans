pragma solidity ^0.4.24;

// This imports truffles testing library
import "truffle/Assert.sol";

// This gets the address of test contract instance
import "truffle/DeployedAddresses.sol";

import "../contracts/One.sol";

contract TestOne {
  One one = One(DeployedAddresses.One());

  function testOne() public {
    uint returnedId = one.returnOne();
    uint expected = 1;
    Assert.equal(returnedId, expected, "Should return 1.");
  }
}