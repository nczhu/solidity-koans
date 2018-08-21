pragma solidity ^0.4.24;
import "truffle/Assert.sol";

contract Test_Bytes_3 {
    
    function test_nil_bytes_equal_zero() public {

    }

    // Ethereum's smart contract storage slot are 256 bits each, or 32 bytes.
    function test_bytes_default_to_32() public {

    }

    function test_bytes_are_bitwise() public {
        // put more robust tests in here
    }

    function test_dynamic_byte_arrays() public {
        // As a rule of thumb, use bytes for arbitrary-length raw byte data and string for arbitrary-length string (UTF-8) data. 
    }
}