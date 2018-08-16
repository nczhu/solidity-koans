pragma solidity ^0.4.24;

import "truffle/Assert.sol";
// This gets the instance address of your contract, deployed in testing env
import "truffle/DeployedAddresses.sol";
import "../contracts/Integer_2.sol";

/*
Test 1 gets you familiar with testing in Solidity, which inherits from Chai
*/

contract Test_Integer_2 {

    Integer_2 instance = Integer_2(DeployedAddresses.Integer_2());

    /* In Solidity, there's no "nil" or "null" or "undefined" default value
     * Uninitiated values are set to 0 by default.
     */
    function test_nil_values_equal_zero() public {
        Assert.equal(0, instance.returnNil(), "nil values should default to 0");  
    }

    // function 
}