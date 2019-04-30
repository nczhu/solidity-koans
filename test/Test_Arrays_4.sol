pragma solidity ^0.5.0;

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
    uint[] integers;
    function test_can_use_arrays_in_Solidity() public {
        bytes32[] memory bytesArray;
        Assert.equal(bytesArray.length, __, "should be an empty bytes array");
        integers.push(12345);
        Assert.equal(integers.length, __, "should be a nonempty array of uints");
    }

    // Arrays initialization defaults to storage, not memory
    // Memory arrays only exist in the scope of the current function
    uint[] storage_array;
    function test_arrays_need_storage_specification() public {
        uint[] memory memory_array;
        memory_array = storage_array;
        // Notice: storage_array = memory_array is NOT allowed
        Assert.equal(memory_array, __, "should be the same array");
    }

    // You can declare an immutable, static array
    uint[1] fixed_array;
    function test_fixed_arrays() public {
        fixed_array[0] = 1;
        Assert.equal(fixed_array[0], __, "should only be able to store 1 uint");
    }

    // You can declare mutable, dynamic arrays
    // Dynamic arrays must be initialized as "storage" variables
    uint[] dynamic_array;
    function test_dynamic_arrays() public {
        dynamic_array.push(1);
        dynamic_array.push(2);
        Assert.equal(dynamic_array.length, __, "should be the correct length");
        dynamic_array.push(3);
        Assert.equal(dynamic_array.length, __, "should be the correct length");
        Assert.equal(dynamic_array[2], __, "should be the correct value at index 2");
    }

    // You can resize dynamic storage arrays
    // You cannot resize memory arrays, nor fixed arrays
    bool[] resizable_array; 
    function test_dynamic_array_resizing() public {
        resizable_array.push(true);
        resizable_array.push(false);
        resizable_array.push(true);
        Assert.equal(resizable_array.length, __, "should be the correct length");
        Assert.equal(resizable_array[2], __, "should be the correct value at index 2");
        resizable_array.length = 2;
        Assert.equal(resizable_array.length, __, "should be the correct length");
        resizable_array.length = 3;
        Assert.equal(resizable_array.length, __, "should be the correct length");
        Assert.equal(resizable_array[2], __, "should be the correct value at index 2");
    }

    // You can have array matrices
    // Notice the [row][col] order is reversed during instantiation vs retrieval
    uint[2][] matrix;
    function test_array_of_arrays() public {
        matrix.push([1, 2]);
        matrix.push([3, 4]);
        matrix.push([5, 6]);
        Assert.equal(matrix[0][1], __, "should be the correct uint value");
        Assert.equal(matrix[1][0], __, "should be the correct uint value");
    }

    // Always be careful when modifying array sizes
    uint[] overflow_array;
    function test_index_overflows() public {
        overflow_array.length--;
        Assert.equal(overflow_array.length, __, "should be an unintended length");
    }
}