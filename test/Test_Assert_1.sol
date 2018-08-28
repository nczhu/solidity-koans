pragma solidity ^0.4.24;

// This is the Koans testing library, which modifies Truffle's standard testing library
import "../contracts/Assert.sol";
import "./Koans.sol";

/*
    In this level, we assert a few assertions
    Some are true and some are false
    The point isn't to be binary 
    But to explore the foundations of Solidity Koans
*/  

contract Test_Assert_1 is Koans{

    /* 
        Similar to Chai and Mocha, you can test boolean results
    */
    function test_should_return_true() public {
        Assert.isTrue(__, "should return true");
    }

    function test_should_return_false() public {
        Assert.isFalse(__, "should return false");
    }

    /* 
        You can test for a == b
    */
    // function test_should_equal_5() public {
    //     uint expected = 5;
    //     uint actual = instance.returnFive();
    //     Assert.equal(__, expected, "should return a uint of 5");
    // }
}