pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

/* 
    You can using mappings in Solidity
    It's similar to hashmaps or dictionaries in other languages
    With a few eccentricities and rules to remember...
 */

contract Test_Mappings_5 is Koans {

    // Mappings is a list of (key => value) pairs and default to storage
    mapping(uint => bytes32) alphabets;
    function test_maps_are_like_hash_tables() public {
        alphabets[0] = "a";
        alphabets[1] = "b";
        alphabets[2] = "c";
        Assert.equal(alphabets[0], __, "should return the 1st letter of alphabet");
        Assert.equal(alphabets[1], __, "should return the 2nd letter of alphabet");
        Assert.equal(alphabets[2], __, "should return the 3rd letter of alphabet");
    }

    // Keys can be all basic data types, even "bytes" and "string"
    // Keys are converted into bytes32 keccak encryptions, so collisions are next to impossible
    mapping(bool => bool) bool_map;
    mapping(bytes32 => bytes32) bytes32_map;
    mapping(string => string) string_map;
    string constant str = "strings can be keys to mappings";

    function test_map_keys_can_be_elementary_datatypes() public {
        bool_map[true] = true;
        bytes32_map[0x0000000000000000000000000000000000000000000000000000000000000000] = 0x0000000000000000000000000000000000000000000000000000000000000001;
        string_map[str] = str;
        Assert.isTrue(__, "should return valid value for bool key");
        Assert.equal(bytes32_map[bytes32(0)], __, "should return valid value for bytes32 key");
        Assert.equal(string_map[str], "strings can be keys to mappings", "should return valid value for string key");
    }

    // Values can be all data types, even arrays, structs, and mappings
    function test_map_values_can_be_complex_datatypes() public {

    }

    // You can look up nonexistent keys and still get returned values
    // See Assert.sol for available assertion methods
    function test_all_keys_return_values() public {
        Assert.__(alphabets[25], "should return default nil value");
        Assert.__(alphabets[9999999], "should return default nil value");
    }

    // Based on the 4 reasons above, you cannot iterate over mappings in Solidity
    // It is good practice to keep an array and count of valid keys, for later access
    function test_save_keys_when_using_mappings() public {

    }

    /* 
        To get iterable mapping functionality, check out this library: 
        https://github.com/ethereum/dapp-bin/blob/master/library/iterable_mapping.sol
    */
}