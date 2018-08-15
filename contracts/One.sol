pragma solidity ^0.4.24;

/* 
 * Level 1: 
 * Pass all the tests in TestOne.sol
 * `Truffle test`: to execute the test. 
 * The script will auto compile & deploy for you.
 */

contract One {
  function returnOne() public returns(uint){
    return (1);
  }
}