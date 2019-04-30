pragma solidity ^0.5.0;

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
    mapping(string => string) string_map;
    string constant str = "strings can be keys to mappings";
    function test_map_keys_can_be_elementary_datatypes() public {
        bool_map[true] = true;
        string_map[str] = str;
        Assert.isTrue(__, "should return valid value for bool key");
        Assert.equal(string_map[str], __, "should return valid value for string key");
    }

    // Values can be complex data types, including arrays, structs, and mappings
    mapping(uint => uint) map_of_ints;
    mapping(uint => uint[]) map_of_ints_array;
    mapping(uint => mapping(uint=>uint)) map_of_map_of_ints; 
    function test_map_values_can_be_complex_datatypes() public {
        map_of_ints[0] = 1 ;
        map_of_ints_array[0] = [2, 3, 4];
        map_of_map_of_ints[0][0] = 5;
        Assert.equal(map_of_ints[0], __, "should equal the correct value");
        Assert.equal(map_of_ints_array[0][1], __, "should equal the correct array value");
        Assert.equal(map_of_map_of_ints[0][0], __, "should equal the correct map value");
    }

    // You can look up nonexistent keys and still get returned values
    // See Assert.sol for available assertion methods
    function test_all_keys_return_values() public {
        Assert.__(alphabets[25], "should return default nil value");
        Assert.__(alphabets[9999999], "should return default nil value");
    }

    // Based on the 4 reasons above, you cannot iterate over mappings in Solidity
    // It is good practice to keep an array and count of valid keys, for later access
    uint[] keys_in_map; 
    mapping(uint => uint) doubles;
    function test_save_keys_when_using_mappings() public {
        doubles[1] = 2;
        doubles[2] = 4;
        doubles[128] = 256;
        // TODO: add the keys to your keys array
        // __ 
        Assert.equal(keys_in_map.length, uint(3), "map should have 4 key value pairs");
        Assert.equal(keys_in_map[2], uint(128), "array should have the key 256");
        Assert.equal(doubles[keys_in_map[1]], __, "should return the correct value for the key");
    }

    /* 
        To get iterable mapping functionality, check out this library: 
        https://github.com/ethereum/dapp-bin/blob/master/library/iterable_mapping.sol
    */
}