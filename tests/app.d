import unit_threaded.runner;

import std.stdio;
import tests.integration;

int main(string[] args) {
    writeln("Unit-threaded examples: Passing\n");
    return runTests!(tests.integration)(args);
}
