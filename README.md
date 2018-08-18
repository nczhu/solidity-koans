# Solidity Koans

The Beginner’s Mind
“If your mind is empty, it is always ready for anything, it is open to everything. In the beginner’s mind there are many possibilities, but in the expert’s mind there are few. ”

So humble yo-self and do some Solidity Koans ;) 

## Ideas To Implement

Levels: Simple data types
- [done]learn about the assert stuff
- [in progress] uint and ints properties, nils, underflow/overflows
- string/bytes and properties
- addresses
- free getter functions

Levels: Complex data types & storage
- arrays (fixed, dynamic)
- mappings
- structs 
- iteration
- storage nuance

Levels: Function & Solidity variable types
- variable passing
- public, private, view, pure

Levels: Handling transactions data
- data
- msg.sender
- msg.value
- gas
- emitting events: good practice
- Transaction nuances: what gets returned, async nature

Levels: exception handling
- require
- asserts
- ...

Levels: Design Patterns (contract to contract):
- interfaces
- librarys
- factory patterns

Security & Best practices: 
- ownership
- math
- overflow, underflow
- re-entry
- tx.origin
- delegatecall: scope
- storage hacks

Machine code: 
- bytecode analysis

## Build Status

## Built Using

## How to Use
 1. Make sure Ganache is running & double check network configs in truffle.js
 2. Navigate between the "test" and "contract" directories to complete each level
 3. "TODO" comments indicate where to make changes to pass the test
 3. To run tests: `truffle test`
 4. To run a specific test: `truffle test ./testFilePath`

## Contributing

 1. Fork it the project
 2. Create your feature branch using issue #: `git checkout -b issue#-feature`
 3. Commit your changes: git commit -am 'Fix/Add/Change: commit msg'
 4. Push to the branch: `git push origin issue#-feature`
 5. Create a new Pull Request

See full list of outstanding [issues](https://github.com/nczhu/soliditykoans/issues) here.

## License
MIT License
