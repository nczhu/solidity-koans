pragma solidity ^0.4.24;

/* 
 * Level 1: 
 * Pass all the tests in TestOne.sol
 * `Truffle test`: to execute the test. 
 * The script will auto compile & deploy for you.
 */

contract Assert_1 {

  // TODO for testShouldReturnTrue()
    function returnTrue() public pure returns(bool){
        return false; 
    }

    // TODO testShouldReturnFalse()
    function returnFalse() public pure returns(bool){
        return true;
    }

    // TODO testShouldEqual5()
    function returnFive() public pure returns(uint){
        return 6;
    }
}