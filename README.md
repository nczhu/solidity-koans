This is an intermediate series for learning Solidity and smart contract development. You will explore technicalities from syntax edgecases, to assembly in the EVM, to smart contract coding conventions, all through test driven development.

> *“If your mind is empty, it is always ready for anything, it is open to everything. In the beginner’s mind there are many possibilities, but in the expert’s mind there are few.”*  
       
  
## Directions
### Setup
* Install [Truffle](https://truffleframework.com/truffle)
* Install and run [Ganache](https://truffleframework.com/ganache) 
* Recommended Text Editors: Vim, Emacs, Sublime
* Hint: Use [Remix IDE](http://remix.ethereum.org) to test potential solutions

### Fail, Fix, and Pass
 1. Run the each level with: `truffle test ./test/Test_FILENAME`
 Tests should initially fail with the test name and error message, e.g.:
 ```
 2) Test_Assert_1
    test_should_return_true::
    Error: should return true
 ```
 2. In your editor, replace `__` with the correct values or code, e.g.: 
 ```
 function test_should_return_true() public {
    Assert.isTrue(true, "should return true");
 }
 ```
 3. To pass the level, make sure:
   * All tests are passing
   * All compiler warnings and errors are fixed

## Learning Path

### Standard data types
1. [Asserts](./test/Test_Assert_1.sol)
2. [Numbers](./test/Test_Numbers_2.sol)
3. [Bytes](./test/Test_Bits_Bytes_3.sol)
4. [Arrays](./test/Test_Arrays_4.sol)
5. [Mappings](./test/Test_Mappings_5.sol)
6. [Structs](./test/Test_Structs_6.sol)
7. [Storage](./test/Test_Storage_7.sol)

### Function types
- variable modifers: public private
- Visbility modifiers: public, private, external, etc.
- Getter modifiers: view, pure, constant

### Transactions details
- address & how its computed
- data types: sender, value, gas
- async return values
- this

### exception handling
- require
- asserts
- events

### Javascript client
- free getter functions
- handling issues
- constructing your send / call fns

### Design patterns
- interfaces
- librarys
- scope variable: super
- factory patterns

### Security
- ownership
- math
- overflow, underflow
- re-entry
- tx.origin
- delegatecall: scope
- storage hacks

### Solidity Assembly
- bytecode analysis
- code in assembly (inside smart contracts)

## Troubleshooting
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
