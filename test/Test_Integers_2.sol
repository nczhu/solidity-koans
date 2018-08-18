pragma solidity ^0.4.24;
import "truffle/Assert.sol";

/*
 * In this level, we learn about bits and ints in Solidity
 * We throw out previous conventions
 * And open our mind to new possibilities
*/
contract Test_Integers_2 {

    /* In Solidity, there's no "nil" or "null" or "undefined" default value
     * Uninitiated values are set to 0 by default.
     */
    function test_nil_ints_equal_zero() public {
        int actual;

        // TODO: fix this expected value
        int expected = 1;
        Assert.equal(expected, actual, "nil values should default to 0");  
    }

    // Bit operators can be used to mask Solidity variables
    function test_bitwise_operator_and() public {
        uint integer = 42;          //or 101010 bitwise
        uint mask = 56;             //or 111000 bitwise
        uint actual = integer & mask; //or 101000 bitwise

        // TODO: give the expected uint value of the bitwise
        uint expected = 0;     
        Assert.equal(expected, actual, "should equal bitwise (integer AND mask)");
    }

    function test_bitwise_operator_xor() public {
        uint integer = 42;          //or 101010 bitwise
        uint mask = 56;             //or 111000 bitwise
        uint actual = integer ^ mask; //or 010010 bitwise

        // TODO: give the expected uint value of the bitwise
        uint expected = 0;     
        Assert.equal(expected, actual, "should equal bitwise (integer XOR mask)");
    }

    //  << and >> shifts the binary values
    function test_left_shift_operand() public {
        uint a = 555555;
        uint b = 5;

        // TODO: Change n to represent the correct shift base value
        uint n = 3;
        uint expected = a<<b;
        uint actual = a * n**b;     //** is exponentiation
        Assert.equal(expected, actual, "should correctly shift binary left");
    }

    // Observe: basic arithmetic operations work as expected
    function test_addition_and_subtraction() public {
        // TODO: change the values of "a" and "b" to pass the tests
        int a = 5;
        int b = -32;

        int expected_sum = 3;
        int expected_diff = -1;
        Assert.equal(expected_sum, (a+b), "should correctly sum a + b");
        Assert.equal(expected_diff, (a-b), "should correctly subtract a + b");
    }

    // Observe: basic arithmetic operations no longer work as expected
    function test_arithmetic_underflows() public {
        uint min = 0;
        uint result = min - 1;
        // TODO: change the test to expect the correct outcome
        Assert.isAtMost(result, min, "result should be 0 or less than 0");
    }

    function test_arithmetic_overflows() public {
        uint max = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
        uint result = max + 1;
        // TODO: change the test to expect the correct outcome
        Assert.isAtLeast(result, max, "result should be 255 or above 255");
    }
}