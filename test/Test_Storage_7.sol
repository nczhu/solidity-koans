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
        1. Local, primitive variables are pushed and popped via the Stack, in LIFO order.
        2. Remember: arrays, structs, mappings, are NOT saved to the Stack.
           Complex datatypes must be saved to Memory or Storage.
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
        1. The EVM allocates infinite memory per computation.
        2. Memory usage consumes more gas than stack usage.
        3. Memory is a single byte array, where new data is appended at the end
        4. As such, you cannot create mappings in memory. This is because 
           mappings have a key, value data structure that only works in Storage
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
        1. Ethereum storage allocates 2^256 bytes of storage per contract.
        2. Storage usage consumes more gas than Memory usage.
        3. Storage is actually a hashmap, with Keys starting at slot 0, and with values of 32bytes.
        4. If data less than 32 bytes in size are grouped together, the EVM will save space 
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
        1. The array length is stored at the next available storage slot p, starting at 0
        2. Array's contents are stored starting at key: keccak256(bytes32(p))
        3. Additional contents are stored at the next offset from the key
    */ 
    uint[] a = [1,2,3];
    
    function test_arrays_default_to_storage() public {
        uint length;
        uint x;
        uint y;
        uint z;

        uint next_slot = uint(__);
        bytes32 p1 = keccak256(abi.encodePacked(next_slot));
        bytes32 p2 = bytes32(uint(p1) + 1); // each uint value takes up 1 slot
        bytes32 p3 = __;
        
        assembly {
            length := sload(2)
            x := sload(p1)
            y := sload(p2)
            y := sload(p3)
        }

        Assert.equal(length, __, "should return the value stored at storage slot 2, i.e. the array length");
        Assert.equal(x, __, "should return the array values stored at storage(array_hash)");
        Assert.equal(y, __, "should return the array values stored at incremented storage index");
        Assert.equal(z, __, "should return the array values stored at incremented storage index");
    }

    /*  How EVM stores mappings:
        1. Mappings are stored more efficiently than arrays
        2. Similarly, p the available slot, is reserved and used to calculate the storage keys
        3. But no values are added to storage at slot p.
        4. The first value is stored at: keccak(key . p), where . is concatenation
        5. Hint: in Sol, you concatenate bytes32 values by: abi.encodePacked(bytes32(key),bytes32(p));
    */

    mapping(uint => bytes32) alphabets;
    function test_mappings_default_to_storage() public {
        alphabets[0] = "a";
        alphabets[1] = "b";
        bytes32 x;
        bytes32 y;
        bytes32 z;
        bytes32 p0 = __;
        bytes32 p1 = __;
        bytes32 p2 = __;

        assembly {
            x := sload(p0)
            y := sload(p1)
            z := sload(p2)
        }

        Assert.equal(x, bytes32(""), "value at p should be nil");
        Assert.equal(y, bytes32("a"), "value at p1 should be a");
        Assert.equal(z, bytes32("b"), "value at p2 should be b");
    }

    /*  How EVM stores structs:
        1. Structs are stored at the next available storage slots
        2. If struct's sequential data is less than 32 bytes, EVM will optimize storage
        3. By compressing struct values in the same 32 byte slot
    */
    Person me = Person("Jane Smith", 30);
    function test_structs_default_to_storage() public {
        bytes32 my_name;
        uint8 my_age;
        bytes32 p1 = __;
        bytes32 p2 = __;

        assembly {
            my_name := sload(p1)
            my_age := sload(p2)
        }

        Assert.equal(my_name, bytes32("Jane Smith"), "value at p1 should be my name");
        Assert.equal(my_age, uint(my_age), "value at p2 should be my age");
    }

    // How many slots in storage do you expect this struct to take up?
    struct ComboLock {
        uint8 code1;
        uint8 code2;
        uint8 code3;
    }

    ComboLock myLock;

    function test_structs_optimize_storage() public {

    }

}