pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

/* In this level we convert data into bytes
 * and do bitwise operations
 * Hint: use https://codebeautify.org/ to do the conversion
 */
contract Test_Bytes_3 is Koans {

    function test_ints_addrs_convert_to_bytes() public {
        int integer = 123456789;
        address addr = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c; // more on addresses later
        Assert.equal(bytes32(integer), __, "should convert integer to bytes32");
        Assert.equal(bytes32(addr), __, "should convert bytes20 bytes16");
    }

    // You can declare bytes of sizes: bytes1, bytes2, bytes32 (but NOT bytes)
    function test_be_careful_about_conversions_and_resizing() public {
        bytes32 a = bytes32(MAX_UINT);
        bytes3 b = bytes3(MAX_UINT);
        Assert.isBelow(uint(__), uint(__), "should not be equal after resizing");
    }

    // function test_bytes_is_not_equal_to_bytes32() public {
    //     // uint large_number = 999999999999999;
    //     // bytes1 one_byte = bytes1(large_number);     //result: 0xff
    //     // bytes2 two_bytes = bytes2(large_number);    //result: 0xffff
        
    //     // // TODO: change the test's input parameters so it passes
    //     // Assert.isBelow(uint(two_bytes), uint(one_byte), "bytes2 should store more data than bytes1");
    // }

    // function test_shrinking_bytes_sizes_corrupts_data() public {

    // }

    // // // You can do bit operation on ints
    // function test_bitwise_operator_and() public {
    // //     uint integer = 42;          //or 101010 bitwise
    // //     uint mask = 56;             //or 111000 bitwise
    // //     uint actual = integer & mask; //or 101000 bitwise

    // //     // TODO: give the expected uint value of the bitwise
    // //     uint expected = 0;     
    // //     Assert.equal(expected, actual, "should equal bitwise (integer AND mask)");
    // }

    // function test_bitwise_operator_xor() public {
    // //     uint integer = 42;          //or 101010 bitwise
    // //     uint mask = 56;             //or 111000 bitwise
    // //     uint actual = integer ^ mask; //or 010010 bitwise

    // //     // TODO: give the expected uint value of the bitwise
    // //     uint expected = 0;     
    // //     Assert.equal(expected, actual, "should equal bitwise (integer XOR mask)");
    // }

    // // // You can shift binary values
    // function test_left_shift_operand() public {
    // //     uint a = 555555;
    // //     uint b = 5;

    // //     // TODO: Change n to represent the correct shift base value
    // //     uint n = 3;
    // //     uint expected = a<<b;
    // //     uint actual = a * n**b;     //** is exponentiation
    // //     Assert.equal(expected, actual, "should correctly shift binary left");
    // }

    // function test_right_shift_operand() public {

    // }

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

