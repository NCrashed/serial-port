serial-port
===========

Crossplatform library for operating with serial ports in D programming language.

Compilation
===========
With [dub](http://code.dlang.org/download):
```
dub build
```

Or, put in your package.json dependencies:
```
"dependencies": {
  "serial-port": "~master"
},
```

To compile tests:
```
dub build --build=unittest --config=unittest
./serial-port
```
You should have two serial ports linked to each other (com0com on Windows, hard links in Posix). For instance, writing to 
'COM1' and reading from 'COM2'.
