pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

/*
    In this level, we learn about ints and uints in Solidity
    We throw out previous conventions
    And open our mind to new possibilities
*/
contract Test_Numbers_2 is Koans {

    function test_you_can_use_ints_and_uints() public {
        int expected_int = -10;
        uint expected_uint = 10;
        Assert.equal(expected_int, int(__), "should recognize int numbers");
        Assert.equal(expected_uint, uint(__), "should recognize uint numbers");
    }

    // Ethereum's smart contract storage slots are 256 bits each, or 32 bytes
    function test_int_defaults_to_32_bytes() public {
        int size_of_int = getIntSize(int(0)); 
        int size_of_int256 = getIntSize(int256(0));
        Assert.equal(size_of_int, int(__), "should equal 32 bytes");
        Assert.equal(size_of_int256, int(__), "should equal 32 bytes");
    }

    // Save gas by using smaller variables that can share the same storage slot
    // Warning: shrinking storage will corrupt data
    function test_shrink_storage_corrupts_data() public {
        uint original = MAX_UINT;
        uint converted = uint(uint16(original));
        Assert.isBelow(__, __, "should not be equal after size conversion");
    }

    // In Solidity, there's no "nil" or "null" or "undefined" default value
    // Uninitiated values are set to the value 0 by default
    function test_nil_ints_equal_zero() public {
        int actual;
        Assert.equal(actual, __, "nil values should default to 0");
        // Reminder: if you get a "TypeError", don't forget to cast your input with int( input );
    }

    // // You can do basic arithmetic operations on ints
    function test_ints_can_be_added_and_subtracted() public {
        
        // TODO: change the values of "a" and "b" to pass the tests
        // add, subtract, divide, mod, **
        int a = 5;
        int b = -32;
        int expected_sum = 3;
        int expected_diff = -1;
        Assert.equal(expected_sum, (a+b), "should correctly sum a + b");
        Assert.equal(expected_diff, (a-b), "should correctly subtract a + b");
    }

    function test_ints_can_be_exponentiated() public {

    }

    function test_ints_can_be_modded() public {

    }

    function test_ints_can_be_operated_compared() public {

    }

    // Beware of arithmetic underflows
    // function test_arithmetic_underflows() public {
    //     uint min = 0;
    //     uint result = min - 1;
        
    //     // TODO: change the test to expect the correct outcome
    //     Assert.isAtMost(result, min, "result should be 0 or less than 0");
    // }

    // // Beware of arithmetic overflows
    // function test_arithmetic_overflows() public {
    //     uint max = MAX_UINT;
    //     uint result = max + 1;
        
    //     // TODO: change the test to expect the correct outcome
    //     Assert.isAtLeast(result, max, "result should be 255 or above 255");
    // }

    // Read about the security issues of arithmetic flows here: 
    // https://medium.com/coinmonks/ethernaut-lvl-5-walkthrough-how-to-abuse-arithmetic-underflows-and-overflows-2c614fa86b74
}