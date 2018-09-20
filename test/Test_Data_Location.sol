pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";


/*
    The Ethereum Virtual Machine has 3 separate places to store data:
    1. Memory: a temporary state that persists within internal function calls
    2. Storage: a permanent state written to the blockchain
    3. Stack/call: a transaction level state saved on the machine stack    
    Data-types have different defaults and quirks when it comes to storage
*/

contract Test_Data_Location is Koans {
    
    function test_basic_data_defaults_to_memory() public {

    }

    function test_functions_params_are_memory() public {

    }

    function 

    // TODO: refactor this out into koans.sol

    /*
        Author: @nczhu
        Function: get_first_nil_slot(uint i)
        Returns: the index of the first nil slot in storage to occur after _initial index              
    */
    function getNextEmptyStorageSlot(uint i) public returns (uint) {
        uint i;
        bytes32 value;
        assembly {value := sload(i)}
        while (value != 0) {
            i++;
            assembly {value := sload(i)}
        }
        return i;
    }

    uint initial_size = get_first_nil_slot(); 

    // todo: I should clear storage after every test suite. aftereach

    // ---------------------------------------------------
    // What is Memory

    // ---------------------------------------------------

    // What is Storage
    // anythign globally declared

    // ---------------------------------------------------
    // Defaults for diff vars


    // uint, bytes, basic types
    // vs structs, arrays, mappings
    // function parameters


    // ---------------------------------------------------
    // Not being careful will override data!!


    // ---------------------------------------------------
    // Storage Layout Optimization

    // globally declared vars
    // structs is even moreimpt

    // ...

    // EVM optimizes struct storage. From the documentation: 
    // Statically-sized variables are laid out contiguously in storage starting from slot position 0. 
    // Multiple items that need less than 32 bytes are packed into a single storage slot if possible.
    
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