serial-port
===========

Crossplatform library for operating with serial ports in D programming language. 
[Documentation](http://ncrashed.github.io/serial-port/index.html).

## Compilation

With [dub](http://code.dlang.org/download):
```
dub build
```
with make
```
make
```

Or, put in your dub.json dependencies:
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

You should have two serial ports linked to each other (com0com on Windows, socat in linux). For instance, writing to 'COM1' and reading from 'COM2'. 
On posix you can use [socat](http://linux.die.net/man/1/socat) to create serial port pipe:

```
socat /dev/ttyS0,raw,echo=0,crnl /dev/ttyS1,raw,echo=0,crnl
```

## References
* [Termios man page](http://linux.die.net/man/3/termios)
* [librs232] (https://github.com/ynezz/librs232)
* [D termios header file](https://github.com/D-Programming-Language/druntime/blob/v2.065.0/src/core/sys/linux/termios.d)
* [Termbits header file](https://github.com/torvalds/linux/blob/9a3c4145af32125c5ee39c0272662b47307a8323/include/uapi/asm-generic/termbits.h)
* [Some useful socat commands](http://technostuff.blogspot.it/2008/10/some-useful-socat-commands.html)


