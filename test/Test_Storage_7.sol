pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";


/*
    The Ethereum Virtual Machine has 3 separate places to "store" data:
    1. Stack: A last-in-first-out container to which values can be pushed and popped, resetting per computation
    2. Memory: An infinitely expandable byte array, resetting per computation
    3. Storage: The contract's long-term state, a key/value store, written onto the blockchain.

    In this level, we learn how the EVM stores primitive vs complex datatypes.

    We'll use some assembly opcodes to directly read from stack, memory or storage.
    But dont worry - you don't have to learn assembly programming just yet.
    Opcode definitions are provided for you inline and here: https://solidity.readthedocs.io/en/v0.4.24/assembly.html
*/

contract Test_Storage_7 is Koans {

    /*  ----------------------Stack-----------------------------
        Locally declared, primitive variables are stored in the Stack.
        This rule excludes arrays, structs, mappings, which must occupy Memory or Storage
    */

    function test_local_primitives_default_to_the_stack() public {
        uint actual;
        uint a = 1;
        uint b = 2;
        // Hint: swap1 is a stack-level command that swaps the most recent and second most recent datapoints on the stack
        assembly { swap1 }
        actual = a ** b;
        Assert.equal(actual, __, "should return the correct exponent, given stack ordering");
    }

    /*  ----------------------Memory-----------------------------
        The EVM allocates infinite memory per computation.
        Memory usage consumes more gas than stack usage.
        You can create temporary arrays and structs with the keyword "memory".
        However, you cannot create mappings in memory.
        This is because mappings have a key, value data structure that only works in Storage
    */

    function test_you_can_create_arrays_in_memory() public {
        uint256[2] memory array = [uint256(16), uint256(32)];
        uint memory_at_c0;
        uint memory_at_e0;
        // Hint: mload(n) reads the data in Memory, at location n (in our case, this starts at 0xc0)
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

    /*  ----------------------Storage-----------------------------
        Ethereum storage allocates 2^256 bytes of storage per contract.
        Storage usage consumes more gas than Memory usage.

        Storage is divided into sequential, 32-byte-sized "slots", starting at index 0.
        If data less than 32 bytes in size are grouped together, the EVM will save space 
        by automatically packing them into a single storage slot of 32 bytes, if possible.
    */

    function test_global_variables_default_to_storage() public {
        bytes1 storage_at_0;
        uint storage_at_1;
        // Hint: sload(n) reads the data in Storage, at slot n
        assembly {
            storage_at_0 := sload(0)
            storage_at_1 := sload(1)
        }
        // Hint: we have some global variables declared by parent contract "Koans.sol"
        Assert.equal(storage_at_0, __, "should return a 1 byte value stored at storage slot 0");
        Assert.equal(storage_at_1, __, "should return a uint256 value stored at storage slot 1");
    }

    /*  How EVM stores arrays:
        1. The array length is stored at the next available storage slot, starting at 0
        1.1 If the array is dynamic...
        A reference to the array is stored...
    */ 
    uint[] a = [1,2,3];
    
    function test_arrays_default_to_storage() public {
        uint x;
        uint y;
        uint z;
        assembly {
            x := sload(1)
            y := sload(2)
            // TODO: replace 3 with the correct hash
            z := sload(3)   
        }
        Assert.equal(x, __, "should return the value stored at storage slot 1");
        Assert.equal(y, __, "should return the value stored at storage slot 2, i.e. the array length");
        Assert.equal(z, __, "should return the optimized array values stored at storage(array_hash)");
    }

    /*  How EVM stores mappings:
        1. Mappings have access to the entire 2^256 storage allocation
        2. The key is hashed
    */
    function test_mappings_default_to_storage() public {

    }

    /*  How EVM stores structs:

    */

    Person son = Person("Jake Smith", 2);
    Person mom = Person("Jane Smith", 30);
    Person dad = Person("John Smith", 32);
    function test_structs_default_to_storage() public {

    }

    // How many slots in storage do you expect this struct to take up?
    struct ComboLock {
        uint8 code1;
        uint8 code2;
        uint8 code3;
    }

    ComboLock myLock;

    function test_structs_optimization() public {

    }

}