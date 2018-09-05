pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

contract Test_Mappings_5 is Koans {

    // Mappings is a list of (key => value) pairs
    mapping(uint => string) alphabets;
    function test_maps_are_hash_tables() public {
        alphabets[0] = "a";
        alphabets[1] = "b";
        alphabets[3] = "c";
        Assert.equal(alphabets[2], __, "should return the 2nd letter of alphabet");
    }

    // Most datatypes can be keys
    // key is hashed into keccak
    function test_any_datatype_can_be_a_key() public {

    }

    // the key is not stored. you can't look up list of keys
    function test_all_keys_return_values() public {

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