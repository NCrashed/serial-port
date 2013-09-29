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
You should have two serial ports linked to each other (com0com on Windows, socat in linux). For instance, writing to 
'COM1' and reading from 'COM2'. On posix you can use socat to create serial port pipe:
```
socat PTY,link=ttyS1 PTY,link=ttyS2
```
