pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";


/*
    The Ethereum Virtual Machine has 3 separate places to store data:
    1. Memory: a temporary state that persists within internal function calls
    2. Storage: a permanent state written to the blockchain
    3. Stack: a transactional, temporary state saved on the stack machine
    Data-types have different defaults and quirks when it comes to storage

    We'll use some assembly in this level to directly access stack, memory or storage.
    You don't have to learn assembly just yet, hints are provided inline.
    For reference: https://solidity.readthedocs.io/en/v0.4.24/assembly.html
*/

contract Test_Storage_7 is Koans {

    // ----------------------Stack-----------------------------

    // Local variables (except arrays, structs, mappings) are stored in the Stack
    function test_basic_data_default_to_stack() public {
        uint actual;
        uint a = 1;
        uint b = 2;
        // Hint: swap1 is a stack-level command that swaps the most recent and second most recent datapoints on the stack
        assembly { swap1 }
        actual = a ** b;
        Assert.equal(actual, __, "should return the correct exponent, given stack ordering");
    }

    // ----------------------Memory-----------------------------

    // Function input arguments are always stored in memory
    function test_functions_params_are_stored_in_memory() public {
        // show that changing array data doesnt change struct...
    }

    // You can create arrays in memory
    function test_create_arrays_in_memory() public {
        
    }

    // You can create mappings in memory
    function test_create_mappings_in_memory() public {
        
    }

    // You can create structs in memory
    function test_create_mappings_in_memory() public {
        
    }

    // ----------------------Storage-----------------------------

    // State (global) variables are stored in Storage
    uint global_var1 = 26; 
    uint global_var2 = 27; 

    function test_global_state_is_always_storage() public {
        uint storage_at_0;
        uint storage_at_1;
        // Hint: sload(n) is a storage-level command that pulls the value currently stored at slot n
        assembly {
            storage_at_0 := sload(0)
            storage_at_1 := sload(1)
        }
        Assert.equal(storage_at_0, __, "should return the value stored at storage slot 0");
        Assert.equal(storage_at_1, __, "should return the value stored at storage slot 1");
    }

    // Local variables of array type reference storage by default
    function test_arrays_default_to_storage() public {

    }

    // Local variables of mapping type reference storage by default
    function test_mapping_default_to_storage() public {

    }

    // Local variables of struct type reference storage by default
    function test_structs_default_to_storage() public {

    }


    // The EVM optimizes struct storage. From the documentation: 
    // Statically-sized variables are laid out contiguously in storage starting from slot position 0. 
    // Multiple items that need less than 32 bytes are packed into a single storage slot if possible.

    function test_EVM_optimizes_storage() public {

    }

    // Last test
    // ---------------------------------------------------
    // Not being careful will override data!!


    // ---------------------------------------------------
    // Storage Layout Optimization


    
    // struct Small {
    //     uint16 num1;
    //     uint16 num2;
    //     bytes32 str; 
    // }

    // struct Big {
    //     uint16 num1;
    //     bytes32 str; 
    //     uint16 num2;
    // }

    // Small s;    // How many slots will a Small struct occupy?
    // Big b;      // How many slots will a Big struct occupy?

    // function test_structs_optimize_storage() public {        
    //     s = Small(1,1,"hi");
    //     uint small_struct_size = getStorageSize();
        
    //     b = Big(1, "hello world", 1);
    //     uint big_struct_size = getStorageSize() - small_struct_size;

    //     Assert.equal(small_struct_size, uint(2), "should be the number of slots it takes to store a Small struct");
    //     Assert.equal(big_struct_size, uint(3), "should be the number of slots it takes to store a Big struct");
    //     Assert.isBelow(small_struct_size, big_struct_size, "Big structs take more storage slots than Small structs");
    // }

}