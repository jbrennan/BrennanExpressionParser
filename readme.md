Brennan’s Expression Parser
---------------------------

This is a basic mathematical expression parser written with the lovely [CoreParse](https://github.com/beelsebob/CoreParse), partially because I needed to parse math, and partially because I wanted to learn how to work with formal grammars and parsers. There are other math parsers for Cocoa, some of which I've used, but this one is my take at it.

To use
------

* Add the project as a submodule and recursively get all submodules.
* Add the project as a sub-project in Xcode.
* Link to the framework.

Build and go!

To do
-----

Oh, so much.

* Better readme, that’s for sure.
* Better support for functions (currently, it just supports `square` and nothing else).
* Support for variables.
* iOS static library (although you can probably jigger this up yourself, I bet you’re smart).
