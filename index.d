Ddoc

$(B serial-port) is simple library for operating with serial ports on different platforms. At the moment
Windows and GNU/Linux tested only.

<h2>Features</h2>
<ul>
<li>Serial port enumerating;</li>
<li>Checking available baud rates</li>
</ul>

<h2>Installing</h2>

With dub, add this to package.json:
---------
"dependencies": {
    "serial-port" : "~master"
}
---------

To compile integration test:
---------
dub build --build=unittest --config=unittest
./serial-port
---------

<h2>TODO</h2>
<ul>
<li>aschynchronous i/o;</li>
<li>more tweaks for com ports;</li>
</ul>
