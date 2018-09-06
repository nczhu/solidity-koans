pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

contract Test_Mappings_5 is Koans {

    // Mappings is a list of (key => value) pairs
    mapping(uint => bytes32) alphabets;
    function test_maps_are_hash_tables() public {
        alphabets[0] = "a";
        alphabets[1] = "b";
        alphabets[2] = "c";
        Assert.equal(alphabets[2], __, "should return the 3rd letter of alphabet");
    }

    // Most datatypes can be keys and values
    // Keys are converted into keccak encryptions
    function test_any_datatype_can_be_a_key() public {

    }

    // Nonexistent keys will still return results
    // TODO i need to be able to solve this one haha
    function test_all_keys_return_values() public {
        Assert.equal(alphabets[0], __, "should return default nil value");
        Assert.equal(alphabets[25], __, "should return default nil value");
        Assert.equal(alphabets[9999999], __, "should return default nil value");
    }

    // is this even a good practice?
    function test_iterate_over_maps() public {

    }

    // all keys exist

    // best practices, map of addresses to ...

    // simple example with simple data

    // complex example with structs/arrays

    // how to iterate maps

}