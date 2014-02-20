module serial_integration_test;

version(unittest)
{
    import serial.device;
    import std.stdio;
    import std.getopt;
    import std.math;
    import std.process;
    import core.time;
    import core.thread;
    
    void main(string[] args)
    {
        auto ports = SerialPort.ports;
        writeln("You have ", ports.length, " available com ports: ", ports);

        string portName1;
        string portName2;
        getopt(args, 
        	"port1", &portName1,
        	"port2", &portName2);
        
        version(linux)
        {
            Pid sockatPid;
            if(portName1 == "" || portName2 == "")
            {
                if(portName1 == "" || portName2 == "")
                {
        	        sockatPid = spawnShell("socat PTY,link=ttyS1 PTY,link=ttyS2");
                }
                portName1 = "ttyS1";
                portName2 = "ttyS2";
            }
            scope(exit) kill(sockatPid);
            Thread.sleep(dur!"msecs"(500));
        } else
        {
            if(portName1 == "" || portName2 == "")
            {
                writeln("Please specify testing ports as --port1=<port name> --port2=<port name>");
                return;
            }
        }
        
        auto com1 = new SerialPort(portName1, dur!"seconds"(1), dur!"seconds"(1));
        auto com2 = new SerialPort(portName2, dur!"seconds"(1), dur!"seconds"(1));
        scope(exit)
        {
            com1.close();
            com2.close();
        }
        
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
        
        writeln("Testing read timeout:");
        bool failed = false;
        auto t = TickDuration.currSystemTick;
        try 
        {
            readed = com2.read(buff);
        }
        catch(TimeoutException e) 
        {
            assert(approxEqual(t.msecs, TickDuration.currSystemTick.msecs));
            failed = true;
        } 
        assert(failed);
        writeln("success!");
    }
}