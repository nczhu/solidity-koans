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

    // Local, single variables (except arrays, structs, mappings) are stored in the Stack
    function test_local_primitives_default_to_the_stack() public {
        uint actual;
        uint a = 1;
        uint b = 2;
        // Hint: swap1 is a stack-level command that swaps the most recent and second most recent datapoints on the stack
        assembly { swap1 }
        actual = a ** b;
        Assert.equal(actual, __, "should return the correct exponent, given stack ordering");
    }

    // ----------------------Memory-----------------------------

    // You can create temporary arrays in memory with keyword "memory"
    function test_you_can_create_arrays_in_memory() public {
        uint256[2] memory array = [uint256(16), uint256(32)];
        uint memory_at_c0;
        uint memory_at_e0;
        // Hint: mload(n) is a memory-level command that loads the variable stored in memory slot n
        // Hint: Memory indices start at 0xc0
        assembly {
            memory_at_c0 := mload(0xc0)
            memory_at_e0 := mload(0xe0) 
        }
        Assert.equal(memory_at_c0, array[uint(__)], "should be the correct value in memory slot 0xc0");
        Assert.equal(memory_at_e0, array[uint(__)], "should be the correct value in memory slot 0xe0");
    }

    // You can create temporary structs in memory with keyword "memory"
    struct Person {
        bytes32 name;
        uint8 age;
    }

    function test_you_can_create_structs_in_memory() public {
        Person memory john = Person("John Doe", 48); 
        bytes32 memory_at_c0;
        uint memory_at_e0;
        assembly {
            memory_at_c0 := mload(0xc0)
            memory_at_e0 := mload(0xe0)
        }
        Assert.equal(memory_at_c0, __, "should be the correct value in memory slot 0xc0");
        Assert.equal(memory_at_e0, __, "should be the correct value in memory slot 0xe0");
    }

    // Note: you cannot create mappings in memory. This is because mappings have access to the entire 2^256 storage

    // ----------------------Storage-----------------------------

    // Global variables are stored in Storage, starting at slot 0
    function test_global_variables_default_to_storage() public {
        bytes1 storage_at_0;
        uint storage_at_1;
        // Hint: sload(n) is a storage-level command that pulls the value currently stored at slot n
        assembly {
            storage_at_0 := sload(0)
            storage_at_1 := sload(1)
        }
        // Hint: we already have global variables initialized in the parent contract "Koans"
        Assert.equal(storage_at_0, __, "should return a 1 byte value stored at storage slot 0");
        Assert.equal(storage_at_1, __, "should return a uint256 value stored at storage slot 1");
    }

    // Local variables of array type reference storage by default
    uint8[] a = [1,2,3];

    // function test_arrays_default_to_storage() public {
    //     uint storage_1;
    //     uint storage_2;
    //     uint storage_3;
    //     assembly {
    //         storage_1 := sload(1)
    //         storage_2 := sload(2)
    //         storage_3 := sload(3)
    //     }
    //     Assert.equal(storage_1, global_var2, "should return the value stored at storage slot 1");
    //     Assert.equal(storage_2, uint(1), "should return the value stored at storage slot 2");
    //     Assert.equal(storage_3, uint(2), "should return the value stored at storage slot 3");
    // }

    // Local variables of mapping type reference storage by default
    function test_mappings_default_to_storage() public {

    }

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