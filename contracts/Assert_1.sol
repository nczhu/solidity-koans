pragma solidity ^0.4.24;

/* 
 * Level 1: 
 * Edit this file to pass all the tests in Test_Assert_1.sol
 * `Truffle test`: to execute the test. 
 * The script will automatically compile & deploy this test contract for you
 */

contract Assert_1 {

  // TODO for test_should_return_true()
    function returnTrue() public pure returns(bool){
        return false; 
    }

    // TODO test_should_return_false()
    function returnFalse() public pure returns(bool){
        return true;
    }

    // TODO test_should_equal_5()
    function returnFive() public pure returns(uint){
        return 6;
    }
}