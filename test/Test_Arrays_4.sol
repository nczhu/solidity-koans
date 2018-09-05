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
    // Memory arrays only exist in the scope of the current function
    function test_arrays_need_storage_specification() public {
        uint[] memory memory_array;
        uint[] storage storage_array;
        memory_array = storage_array;
        // Notice: storage_array = memory_array is NOT allowed
        Assert.equal(memory_array, __, "should be the same array");
    }

    // You can declare an immutable, static array
    function test_fixed_arrays() public {
        uint[1] storage array;
        array[0] = 1;
        Assert.equal(array[0], __, "should only be able to store 1 uint");
    }

    // You can declare mutable, dynamic arrays
    // Dynamic arrays must be initialized as "storage" variables
    function test_dynamic_arrays() public {
        uint[] storage array;
        array.push(1);
        array.push(2);
        Assert.equal(array.length, __, "should be the correct length");
        array.push(3);
        Assert.equal(array.length, __, "should be the correct length");
        Assert.equal(array[2], __, "should be the correct value at index 2");
    }

    // You can resize dynamic storage arrays
    // You cannot resize memory arrays, nor fixed arrays
    function test_dynamic_array_resizing() public {
        bool[] storage array; 
        array.push(true);
        array.push(false);
        array.push(true);
        Assert.equal(array.length, __, "should be the correct length");
        Assert.equal(array[2], __, "should be the correct value at index 2");
        array.length = 2;
        Assert.equal(array.length, __, "should be the correct length");
        array.length = 3;
        Assert.equal(array.length, __, "should be the correct length");
        Assert.equal(array[2], __, "should be the correct value at index 2");
    }

    // You can have array matrices
    // Notice the [row][col] order is reversed during instantiation vs retrieval
    function test_array_of_arrays() public {
        uint[2][] storage matrix;
        matrix.push([1, 2]);
        matrix.push([3, 4]);
        matrix.push([5, 6]);
        Assert.equal(matrix[0][1], __, "should be the correct uint value");
        Assert.equal(matrix[1][0], __, "should be the correct uint value");
    }

    // Always be careful when modifying array sizes
    function test_index_overflows() public {
        uint[] storage array;
        array.length--;
        Assert.equal(array.length, __, "should be an unintended length");
    }
}