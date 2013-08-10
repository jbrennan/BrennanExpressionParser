Brennan’s Expression Parser
---------------------------

This is a basic mathematical expression parser written with the lovely [CoreParse](https://github.com/beelsebob/CoreParse), partially because I needed to parse math, and partially because I wanted to learn how to work with formal grammars and parsers. There are other math parsers for Cocoa, some of which I've used, but this one is my take at it.

It's also pretty damn-well documented, if I may say so.

What it does
------------

ExpressionParser can:

* answer skill-testing questions like `3 * (4 /3) - 1`.
* do your trigonometry homework like `sin(3) - cos(tan(2 + exp(2)))`
* act like dice `random(12)` (gives you a number between 0-11, inclusive)
* teach you algebra `x + 3` where `x` gets defined at runtime!
* let you define your own, **Blocks-based** functions at runtime, so you can teach it new kinds of math. There are a bunch built in, too.

To use
------

* Add the project as a submodule and recursively get all submodules.
* Add the project as a sub-project in Xcode.
* Link to the framework and import the header.

Build and go!

To do
-----

Oh, so much.

* Better readme, that’s for sure.
* iOS static library (although you can probably jigger this up yourself, I bet you’re smart).
