serial-port
===========

Crossplatform library for operating with serial ports in D programming language. [Documentation](http://ncrashed.github.io/serial-port/index.html).

Compilation
===========
With [dub](http://code.dlang.org/download):
```
dub build
```
with make
```
make
```

Or, put in your package.json dependencies:
```
"dependencies": {
  "serial-port": "~master"
},
```

To compile tests with dub:
```
dub build --build=unittest --config=unittest
./serial-port
```
with make
```
make test
./serial-port
```

You should have two serial ports linked to each other (com0com on Windows, socat in linux). For instance, writing to 
'COM1' and reading from 'COM2'. On posix you can use socat to create serial port pipe:
```
socat PTY,link=ttyS1 PTY,link=ttyS2
```
# References
* [Termios man page](http://linux.die.net/man/3/termios)
* [librs232] (https://github.com/ynezz/librs232)
