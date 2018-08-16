pragma solidity ^0.4.24;

import "truffle/Assert.sol";
// This gets the instance address of your contract, deployed in testing env
import "truffle/DeployedAddresses.sol";
import "../contracts/Assert_1.sol";

/*
Test 1 gets you familiar with testing in Solidity, which inherits from Chai
*/

contract Test_Assert_1 {

    Assert_1 instance = Assert_1(DeployedAddresses.Assert_1());

    function testShouldReturnTrue() {
        bool actual = instance.returnTrue();  
        Assert.isTrue(actual, "returnTrue() should return true");
    }

    function testShouldReturnFalse() {
        bool actual = instance.returnFalse();
        Assert.isFalse(actual, "returnFalse() should return false");
    }

    function testShouldEqual5(){
        uint expected = 5;
        uint actual = instance.returnFive();
        Assert.equal(actual, expected, "returnFive() should return a uint of 5");
    }
}