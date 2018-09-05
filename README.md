# Solidity Koans

“If your mind is empty, it is always ready for anything, it is open to everything. In the beginner’s mind there are many possibilities, but in the expert’s mind there are few. ”

So humble yo-self and do some Solidity Koans ;)

## Directions

 1. Make sure Ganache is running & double check network configs in truffle.js
 2. To run tests: `truffle test`
 3. To run a specific test: `truffle test ./testFilePath`
 4. To pass a level, make sure to: 
 ⋅⋅* fill in all underscores `__`
 ⋅⋅* fix all compiler warnings and errors

## Troubleshooting
- `Member "..." not unique after argument-dependent lookup in type(library Assert)`. *Solution*: try typecasting your answer to solve compiler issues.

## Levels

### Solidity data types
1. [Asserts](./test/Test_Assert_1.sol)
2. [Numbers](./test/Test_Numbers_2.sol)
3. [Bytes](./test/Test_Numbers_2.sol)
4. [Arrays](./test/Test_Numbers_2.sol)
5. [Structs](./test/Test_Structs_5.sol)
6. [Maps & Iteration](./test/Test_Mappings_6.sol)
7. Iteration - in progress
8. Storage nuance

### Function types
- variable modifers: public private
- Visbility modifiers: public, private, external, etc.
- Getter modifiers: view, pure, constant

### Transactions
- data
- msg.sender
- msg.value
- gas
- emitting events: good practice
- Transaction nuances: what gets returned, async nature
- scope variable: this

### exception handling
- require
- asserts
- ...
- passing storage arrays rather than memory arrays

### Javascript & client
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

## Contributing

 1. Fork it the project
 2. Create your feature branch using issue #: `git checkout -b issue#-feature`
 3. Commit your changes: git commit -am 'Fix/Add/Change: commit msg'
 4. Push to the branch: `git push origin issue#-feature`
 5. Create a new Pull Request

See full list of outstanding [issues](https://github.com/nczhu/soliditykoans/issues) here.

## Design Decisions
- Rewrote Assert.sol to accommodate for additional data types. Modifications are signed inline with @nczhu

## License
MIT License
