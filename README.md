This is an intermediate series for learning Solidity and smart contract development. You will explore technicalities from syntax edgecases, to assembly in the EVM, to smart contract coding conventions, all through test driven development.

> *“If your mind is empty, it is always ready for anything, it is open to everything. In the beginner’s mind there are many possibilities, but in the expert’s mind there are few.”*  
       
## Learning Path
---
### Standard data types
1. [Asserts](./test/Test_Assert_1.sol)
2. [Numbers](./test/Test_Numbers_2.sol)
3. [Bytes](./test/Test_Bits_Bytes_3.sol)
4. [Arrays](./test/Test_Arrays_4.sol)
5. [Mappings](./test/Test_Mappings_5.sol)
6. [Structs](./test/Test_Structs_6.sol)
7. [Storage](./test/Test_Storage_7.sol)

### Function types (in progress)
- variable modifers: public private
- Visbility modifiers: public, private, external, etc.
- Getter modifiers: view, pure, constant

### Transactions details (in progress)
- address & how its computed
- data types: sender, value, gas, this
- async return values

### Javascript client (in progress)
- events
- error handling: require, asserts
- free getter functions
- constructing send / call fns

### Design patterns (in progress)
- interfaces
- libraries, ERC libs
- factory patterns

### Security (in progress)
- ownership
- overflow, underflow
- re-entry
- tx.origin
- delegatecall: scope
- storage hacks

### Solidity Assembly (in progress)
- bytecode & opcodes

## Directions
### Setup
* Install [Truffle](https://truffleframework.com/truffle)
* Install and run [Ganache](https://truffleframework.com/ganache) 
* Recommended Text Editors: Vim, Emacs, Sublime
* Hint: Use [Remix IDE](http://remix.ethereum.org) to test potential solutions

### Fail, Fix, and Pass
 1. Each test is initially incomplete, e.g.: 
 ```
 function test_should_return_true() public {
    Assert.isTrue(__, "should return true");
 }
 ```
 2. Run each level with: `truffle test ./test/Test_FILENAME`
 Tests will fail with error messages, e.g.:
 ```
 2) Test_Assert_1
    test_should_return_true::
    Error: should return true
 ```
 3. In your editor, replace `__` with the correct values or code, e.g.: 
 ```
 function test_should_return_true() public {
    Assert.isTrue(true, "should return true");
 }
 ```
 4. To pass each level, make sure:
   * All tests are passing
   * All compiler warnings and errors are fixed

## Troubleshooting
<hr>
- `Member "..." not unique after argument-dependent lookup in type(library Assert)`. *Solution*: try typecasting your answer to solve compiler issues.

## Contributing
 1. Fork it the project
 2. Create your feature branch using issue #: `git checkout -b issue#-feature`
 3. Commit your changes: `git commit -am 'Fix/Add/Change: commit msg'`
 4. Push to the branch: `git push origin issue#-feature`
 5. Create a new Pull Request

See full list of outstanding [issues](https://github.com/nczhu/soliditykoans/issues) here.

## Design Decisions
- Rewrote Assert.sol to accommodate for additional data types. Modifications are signed inline with @nczhu

## License
MIT License
