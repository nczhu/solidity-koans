pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

/* 
    You can create structs in Solidity, like objects in OOP
    Structs are composite data types that optimize storage
*/

contract Test_Structs_6 is Koans {

    struct Orchard {
        uint total_trees;
        bool in_season;
    }

    Orchard orange_grove;
    function test_structs_are_composite_variables() public {
        orange_grove.total_trees = 2048;
        orange_grove.in_season = true;
        Assert.__(orange_grove.in_season, "orange grove should be in season");
        Assert.equal(orange_grove.total_trees, __, "orange grove should have many trees");
    }

    function test_structs_accept_object_notation() public {
        orange_grove = Orchard(12345, true);
        Assert.__(orange_grove.in_season, "orange grove should be in season");

        orange_grove = Orchard({total_trees: 54321, in_season: false});
        Assert.equal(orange_grove.total_trees, __, "orange grove should have many trees");

    }

    // ---------------------------------------------------

    function test_structs_can_contain_functions() public {

    }

    function test_structs_can_contain_mappings() public {

    }

    // It is common practice to keep an array, i.e. list of structs
    function test_you_can_have_arrays_of_structs() public {

    }

    // Pro tip: Solidity won't let you return structs from functions
    // However, you can get the same desired functionality by creating
    // A mapping of structs, which has a default, getter function
    function test_you_can_have_mappings_of_structs() public {

    }

    function test_structs_optimize_storage() public {

    }

    // Structs default to storage, not memory
    // Warning: Solidity doesn't throw warnings when you create structs
    // Inside functions, and overrides storage of other values
    // You should never do the following
    function test_structs_default_to_storage() public {
        // Funder f;         //this defaults to storage
        // f.address = ...;
        // f.amount = ...;
    }

}