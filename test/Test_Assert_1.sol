pragma solidity ^0.4.24;

// Best thing to do is to overwrite this
// import "truffle/Assert.sol";
// This gets the instance address of your contract, deployed in testing env
import "truffle/DeployedAddresses.sol";
import "../contracts/Assert_1.sol";
import "../contracts/Assert.sol";

/*
 * In this level, we assert a few assertions
 * Some are true and some are false
 * The point isn't to be binary 
 * But to explore the foundations of Solidity Koans
*/  

contract Test_Assert_1 {
    bytes1 public __; 

    Assert_1 instance = Assert_1(DeployedAddresses.Assert_1());

    function test_should_return_true() public {
        bool actual = instance.returnTrue();  
        Assert.isTrue(__, "should return true");
    }

    function test_should_return_false() public {
        bool actual = instance.returnFalse();
        Assert.isFalse(__, "should return false");
    }

    function test_should_equal_5() public {
        uint expected = 5;
        uint actual = instance.returnFive();
        Assert.equal(__, expected, "should return a uint of 5");
    }
}