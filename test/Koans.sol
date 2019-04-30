pragma solidity ^0.5.0;

// this file save all the constants

contract Koans {

    // We arbitrarly chose bytes1 type to represent and invalid input
    bytes1 public __;
    uint public MAX_UINT = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

    // ************************************** custom functions **************************************
    /*
        Author: @nczhu
        Function: intSize(int a)
        Returns: returns the storage size of the integer, in Bytes
    */
    function getIntSize(int a) public pure returns (int) {
        a = 0; //suppresses compiler warning
        return 32;
    }

    /*
        Author: @nczhu
        Function: getStorageSize()
        Returns: returns the current contract storage size, in slots
        Vulnerabilities: stops at 0, so valid 0 values will end the loop.
        TODO: fix this vulnerability :)
    */
    // function getStorageSize() public returns(uint){
    //     uint i;
    //     bytes32 value;
    //     assembly {value := sload(i)}
    //     while (value != 0) {
    //         i++;
    //         assembly {value := sload(i)}
    //     }
    //     return i;
    // }
}
