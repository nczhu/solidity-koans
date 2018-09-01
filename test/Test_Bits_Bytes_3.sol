pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

/* In this level we convert data into bytes
 * and do bitwise operations
 * Hint: use https://codebeautify.org/ to do the conversion
 */
contract Test_Bits_Bytes_3 is Koans {
    bytes hello_world = "hello world";

    function test_integers_convert_to_bytes() public {
        int integer = 123456789;
        Assert.equal(bytes32(integer), __, "should convert integer to bytes32");
    }

    // You can declare bytes of sizes: bytes1, bytes2, bytes32 (but NOT bytes)
    function test_shrinking_and_converting_bytes_corrupts_data() public {
        bytes32 a = bytes32(MAX_UINT);
        bytes3 b = bytes3(MAX_UINT);
        Assert.isBelow(uint(__), uint(__), "should not be equal after resizing");
    }

    // You can do bitwise operations    
    function test_bitwise_operator_AND() public {
        bytes2 data = 0xffff;
        bytes2 mask = 0xf0f0;
        bytes2 and_masked = data & mask;
        bytes2 or_masked = data | mask;
        Assert.equal(and_masked, __, "should equal the bitwise of (integer AND mask)");
        Assert.equal(or_masked,__, "should equal the bitwise of (integer OR mask)");
    }

    // Likewise, you can do bitwise operations on ints
    function test_bitwise_operator_XOR() public {
        uint integer = 42;              // or 101010 bitwise
        uint actual = integer ^ 56;   
        Assert.equal(actual, __, "should equal the bitwise of (integer XOR mask)");
    }

    // You can shift bits with bytes variables
    function test_left_shift_operand() public {
        bytes4 a = 0xffffffff;
        bytes4 actual = a << 2;
        Assert.equal(actual, __, "should equal 0xffffffff shifted left by 2 bits");
    }

    // Likewise, you can shift bits with integers
    function test_right_shift_operand() public {
        uint a = 555555;
        uint actual = a >> 5;
        Assert.equal(actual, __, "should correctly shift a right by 5 bits");
    }

    // "bytes" is a special variable type.
    // "bytes" is an array of single bytes, similar to "string" and "byte[]"
    //  bytes hello_world = "hello world";
    function test_bytes_are_like_strings() public {
        uint string_length = hello_world.length;
        bytes1 first_byte = hello_world[0];
        bytes1 last_byte = hello_world[string_length-1];
        Assert.equal(string_length, __, "should be the byte length of the hello world string");
        Assert.equal(first_byte, __, "should be the UTF-8 of the first byte");
        Assert.equal(last_byte, __, "should be the UTF-8 of the last byte");
    }

}

