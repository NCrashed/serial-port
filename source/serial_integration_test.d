module serial_integration_test;

version(unittest)
{
    import serial.device;
    import std.stdio;

    void main()
    {
        auto ports = SerialPort.ports;
        writeln("You have ", ports.length, " available com ports: ", ports);

        if(ports.length < 2)
        {
            writeln("To run tests you should have two serial ports connected to each other.");
            writeln("On Windows you can use com0com emulator.");
            writeln("On Posix you can create two hard links to files.");
            return;
        }

        auto com1 = new SerialPort(ports[0]);
        auto com2 = new SerialPort(ports[1]);
        writeln("Testing first port available baud rates:");
        writeln(com1.getBaudRates);

        writeln("Testing second port available baud rates:");
        writeln(com2.getBaudRates); 

        writeln("Testing low-level read-write:");
        string hello = "Hello, World!";
        com1.write(cast(void[])hello);

        ubyte[13] buff;
        size_t readed = com2.read(buff);
        string recievedString = cast(string)(buff[0..readed]).idup;
        assert(recievedString == hello, "Recieved string: "~recievedString);
        writeln(recievedString);
    }
}