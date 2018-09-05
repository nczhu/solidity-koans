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
    function test_array_initialization() public {
        uint[] integers;
        bytes32[] bytesArray;
        Assert.equal(integers.length, __, "should be an empty uints array");
        Assert.equal(bytesArray.length, __, "should be an empty bytes array");
    }

    function test_arrays_index_at_zero() public {

    }

    // The previous test generated compilation warnings
    // This one doesn't
    function test_arrays_need_storage_specification() public {

    }


    function test_static_array() public {

    }

    function test_dynamic_array() public {
        
    }

    function test_memory_vs_storage() public {

    }

    function test_can_resize_arrays() public {
        // arrays can only be resized in storage, not memory;
// https://delegatecall.com/questions/workaround-for-return-dynamic-array-from-solidity69924f08-a061-426f-a326-2bed3f566e53

    }

    function test_2d_arrays() public {

    }
}