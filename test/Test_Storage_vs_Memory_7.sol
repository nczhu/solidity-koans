pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";


/*
    Like all stack based machines, the Ethereum Virtual Machine
    Separately accesses a memory and a storage
    Memory persists within the function, while
    Storage is written into the blockchain
*/
contract Test_Storage_vs_Memory is Koans {

        // ---------------------------------------------------

    // EVM will optimize struct storage, based on documentation: 
    // Statically-sized variables are laid out contiguously in storage starting from slot position 0. 
    // Multiple items that need less than 32 bytes are packed into a single storage slot if possible
    struct Small {
        uint16 num1;
        uint16 num2;
        bytes32 str; 
    }

    struct Big {
        uint16 num1;
        bytes32 str; 
        uint16 num2;
    }
    Small s;    // How many slots will a Small struct occupy?
    Big b;      // How many slots will a Big struct occupy?

    function test_structs_optimize_storage() public {        
        s = Small(1,1,"hi");
        uint small_struct_size = getStorageSize();
        
        b = Big(1, "hello world", 1);
        uint big_struct_size = getStorageSize() - small_struct_size;

        Assert.equal(small_struct_size, uint(2), "should be the number of slots it takes to store a Small struct");
        Assert.equal(big_struct_size, uint(3), "should be the number of slots it takes to store a Big struct");
        Assert.isBelow(small_struct_size, big_struct_size, "Big structs take more storage slots than Small structs");
    }

     function getStorageSize() public returns(uint){
        uint i;
        bytes32 value;
        assembly {value := sload(i)}
        while (value != 0) {
            i++;
            assembly {value := sload(i)}
        }
        return i;
    }

}