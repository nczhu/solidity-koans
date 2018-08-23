pragma solidity ^0.4.24;

contract Bytes_3 {
    
    bytes public bytes_array = "";
    
    function byteArrays() public {
        bytes_array.length += 7;
        bytes_array[3] = 8;
        delete bytes_array[2];
    }
    
}