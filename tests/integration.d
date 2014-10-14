module tests.integration;

import std.stdio;
import core.time;
import unit_threaded;

import serial.device;

void testWrite() {
   Duration timeout = dur!("msecs")(2000);
   string port = "/dev/ttyS2";
   version(Windows) {
      port = "COM1";
   }

   auto com = new serial.device.SerialPort(port, timeout, timeout);
   scope (exit) com.close;

   com.speed = BaudRate.BR_115200;
   com.dataBits = DataBits.data7;
   com.parity = Parity.even;
   com.stopBits = StopBits.two;

   //string test = "Hello, World!\n";
   //com.write(test.ptr);
   ubyte[] test = [0x40, 0x30, 0x30, 0x52, 0x0d];
   com.write(test);
   //string message = "abc\n";
   //com.write(cast(void[])message);
}

void testParity() {
   string port = "/dev/ttyS2";
   version(Windows) {
      port = "COM1";
   }
   Duration timeout = dur!("msecs")(2000);

   auto com = new serial.device.SerialPort(port, timeout, timeout);
   scope (exit) com.close;

   com.speed = BaudRate.BR_115200;
   com.dataBits = DataBits.data7;

   com.parity = Parity.even;
   //assert(com.parity == Parity.even);
   com.parity.shouldEqual(Parity.even);

   com.parity = Parity.odd;
   assert(com.parity == Parity.odd);
   com.parity.shouldEqual(Parity.odd);

   com.parity = Parity.none;
   assert(com.parity == Parity.none);

}

void testBits() {
   string port = "/dev/ttyS0";
   version(Windows) {
      port = "COM1";
   }
   Duration timeout = dur!("msecs")(2000);

   auto com = new serial.device.SerialPort(port, timeout, timeout);
   scope (exit) com.close;

   com.speed = BaudRate.BR_115200;
   com.parity = Parity.even;

   com.dataBits = DataBits.data7;
   assert(com.dataBits == DataBits.data7);

   com.dataBits = DataBits.data6;
   assert(com.dataBits == DataBits.data6);

   com.dataBits = DataBits.data5;
   assert(com.dataBits == DataBits.data5);

}
