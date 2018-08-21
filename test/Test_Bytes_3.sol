pragma solidity ^0.4.24;
import "truffle/Assert.sol";


/* In this level we learn 
 *
 */
contract Test_Bytes_3 {
    
    // Ethereum's smart contract storage slot are 256 bits each, or 32 bytes.
    // You can save storage space (i.e. gas) by initiating bytes to the minimum needed size.
    function test_bytes_default_to_32() public {
        bytes1 one_byte = ;
        bytes2 two_bytes = ;
        bytes3 three_bytes = ; 
        bytes32 max_bytes = ;
    }

    function test_nil_bytes_equal_zero() public {

    }

    function test_bytes_are_bitwise() public {

    }

    // Use "bytes" to store arbitrary-length byte arrays
    function test_dynamic_byte_arrays() public {
        // As a rule of thumb, use bytes for arbitrary-length raw byte data and string for arbitrary-length string (UTF-8) data. 
    }

    // Use "string" to store arbitrary-length string
    function test_dynamic_size_strings() public {

    }
}