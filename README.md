# Solidity Koans

“If your mind is empty, it is always ready for anything, it is open to everything. In the beginner’s mind there are many possibilities, but in the expert’s mind there are few. ”

So humble yo-self and do some Solidity Koans ;)

## Directions

 1. Make sure Ganache is running & double check network configs in truffle.js
 2. Fill in the double underscores: __ to pass each unit test. To correctly pass each level, make sure you're solutions fixed all compiler warning as well.
 3. To run tests: `truffle test`
 4. To run a specific test: `truffle test ./testFilePath`

## Troubleshooting
Issue: Member "..." not unique after argument-dependent lookup in type(library Assert)
Solution: try typecasting your answer to solve compiler issues.

## Levels - in progress

----------- Data -----------
Levels: Elementary data types
- asserts: DONE
- numbers: IN PROGRESS
- addresses
- everything is a byte (primitive)
- strings



Levels: Complex data types
- arrays (fixed, dynamic)
- mappings
- structs 
- iteration
- storage nuance

----------- Smart contracts -----------
Levels: Function & Solidity variable types
- variable modifers: public private
- Visbility modifiers: public, private, external, etc.
- Getter modifiers: view, pure, constant

Levels: Handling transactions data (special variables). B9
- data
- msg.sender
- msg.value
- gas
- emitting events: good practice
- Transaction nuances: what gets returned, async nature
- scope variable: this

Levels: exception handling
- require
- asserts
- ...
- passing storage arrays rather than memory arrays

----------- JS ----------- 

Levels: connecting the client
- free getter functions
- handling issues
- constructing your send / call fns

----------- Design Patterns ----------- 
- interfaces
- librarys
- scope variable: super
- factory patterns

----------- Security -----------  
- ownership
- math
- overflow, underflow
- re-entry
- tx.origin
- delegatecall: scope
- storage hacks

----------- Solidity Assembly ----------- 
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
