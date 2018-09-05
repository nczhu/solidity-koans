pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

/* 
    One day Chao-chou fell down in the snow, and called out, 
    “Help me up! Help me up!” 
    A monk came and lay down beside him. 
    Chao-chou got up and went away.
  
    In this level we learn about arrays
    The monk reminds you that you don't actually need any help to solve this level.
 */

contract Test_Arrays_4 is Koans {

    // You can create arrays of different data types
    // You can check the lengths of your arrays
    function test_can_use_arrays_in_Solidity() public {
        bytes32[] bytesArray;
        Assert.equal(bytesArray.length, __, "should be an empty bytes array");
        
        uint[] integers;
        integers.push(12345);
        Assert.equal(integers.length, __, "should be a nonempty array of uints");
        
    }

    // Arrays initialization defaults to storage, not memory
    // Lack of specificity will generate compilation warnings
    function test_arrays_need_storage_specification() public {
        uint[] memory memory_array;
        uint[] storage storage_array;
        memory_array = storage_array;
        // storage_array = memory_array is NOT allowed
        Assert.equal(memory_array, __, "should be the same array");
    }

        // function test_can_resize_arrays() public {
        // arrays can only be resized in storage, not memory;
        // https://delegatecall.com/questions/workaround-for-return-dynamic-array-from-solidity69924f08-a061-426f-a326-2bed3f566e53

    // }

    // You can truncate arrays, or lengthen arrays
    function test_can_resize_arrays() public {

    }

    function test_memory_vs_storage() public {

    }

    function test_static_array() public {

    }

    function test_dynamic_array() public {
        
    }

    function test_out_of_bounds_array() public {

    }

    // You can have a 2D matrix of arrays
    function test_array_of_arrays() public {

    }
}