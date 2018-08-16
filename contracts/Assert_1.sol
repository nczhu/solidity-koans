pragma solidity ^0.4.24;

/* 
 * Level 1: 
 * Edit this file to pass all the tests in Test_Assert_1.sol
 * `Truffle test`: to execute the test. 
 * The script will automatically compile & deploy this test contract for you
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