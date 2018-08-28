pragma solidity ^0.4.24;

// This is the Koans testing library, which modifies Truffle's standard testing library
import "../contracts/Assert.sol";
import "./Koans.sol";

/*
    In this level, we assert a few assertions
    Some are true and some are false
    The point isn't to be redundant
    But to learn how to test Solidity code
*/  

contract Test_Assert_1 is Koans{

    // You can make the tests fail in specific places in your code
    function test_should_fail_by_default() public {
        Assert.fail("should always fail, delete this line to proceed");
    }

    // You can test if a condition returns true
    function test_should_return_true() public {
        Assert.isTrue(__, "should return true");
    }

    // You can test if a condition returns true
    function test_should_return_false() public {
        Assert.isFalse(__, "should return false");
    }

    // You can test for equality on basic data types
    function test_bools_are_equal() public {
        bool actual = true;
        Assert.equal(actual, __ , "should be equal"); 
    }

    // But you can only compare apples to apples
    function test_ints_are_not_equal() public {
        int actual = -5;

        // Hint: try typecasting your answer to solve compiler issues
        Assert.notEqual(actual, __ , "should NOT be equal");
    }

    // function test_should_equal_5() public {
    //     uint expected = 5;
    //     uint actual = instance.returnFive();
    //     Assert.equal(__, expected, "should return a uint of 5");
    // }
}