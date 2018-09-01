pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

/* In this level we convert data into bytes
 * and do bitwise operations
 * Hint: use https://codebeautify.org/ to do the conversion
 */
contract Test_Bits_Bytes_3 is Koans {

    function test_some_datatypes_convert_to_bytes() public {
        int integer = 123456789;
        address addr = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c; // more on addresses later
        Assert.equal(bytes32(integer), __, "should convert integer to bytes32");
        Assert.equal(bytes32(addr), __, "should convert bytes20 bytes16");
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
        uint mask = 56;                 //or 111000 bitwise
        uint actual = integer ^ mask;   //or 010010 bitwise
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
        uint b = 5;
        uint actual = a >> b;
        Assert.equal(actual, __, "should correctly shift a right by 5 bits");
    }

    // function test_bytes_are_bitwise() public {
    //     // bytes2 data = 0xffff;
    //     // bytes2 mask = 0xf0f0;

    //     // // TODO: fill in the byte value of the "expected_and" and "expected_xor" to pass the test
    //     // bytes2 expected_and; 
    //     // bytes2 expected_xor;

    //     // Assert.equal(expected_and, (data & mask), "should return the AND of data and mask");
    //     // Assert.equal(expected_xor, (data ^ mask), "should return the XOR of data and mask");
    // }

    // /* "bytes" denote a dynamically sized byte ARRAY, like byte[]
    //  */
    // function test_can_have_bytes_array_() public {
    //     // this part needs to be in a contract

    // }

    // function test_enlarging_byte_arrays() public {
    
    // }

    // /* As a rule of thumb, use bytes for arbitrary-length raw byte data 
    //  * and string for arbitrary-length string (UTF-8) data. 
    //  */
    // function test_bytes_array_are_similar_to_strings() public {

    // }
}

