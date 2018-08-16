pragma solidity ^0.4.24;

import "truffle/Assert.sol";
// This gets the instance address of your contract, deployed in testing env
import "truffle/DeployedAddresses.sol";
import "../contracts/Nil_2.sol";

/*
Test 1 gets you familiar with testing in Solidity, which inherits from Chai
*/

contract Test_Nil_2 {

    Nil_2 instance = Nil_2(DeployedAddresses.Nil_2());

    function testShouldReturnTrue() {
   
    }

}