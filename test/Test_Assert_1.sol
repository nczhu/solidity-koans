pragma solidity ^0.4.24;

import "truffle/Assert.sol";
// This gets the instance address of your contract, deployed in testing env
import "truffle/DeployedAddresses.sol";
import "../contracts/Assert_1.sol";

/*
 * Test 1 gets you familiar with testing in Solidity, which inherits from Chai
 * Look in ../contracts/Assert_1.sol for the functions you must modify to pass this level
*/

contract Test_Assert_1 {

    Assert_1 instance = Assert_1(DeployedAddresses.Assert_1());

    function test_should_return_true() public {
        bool actual = instance.returnTrue();  
        Assert.isTrue(actual, "should return true");
    }

    function test_should_return_false() public {
        bool actual = instance.returnFalse();
        Assert.isFalse(actual, "should return false");
    }

    function test_should_equal_5() public {
        uint expected = 5;
        uint actual = instance.returnFive();
        Assert.equal(actual, expected, "should return a uint of 5");
    }
}