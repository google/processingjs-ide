# Notes about grammar

First things first. The grammar defined here is *not* a proper grammar for the
Processing.js language. It is not even intended to be such by design.
What it tries to achieve instead, is to be able to parse even incorrect programs
and localize syntax errors as well as it can.

Depending on the problem in the program, this can be achieved with varying accuracy.
For example, duplicate definitions of functions or typo in variable names can
be pinpointed. On the other hand, brace or parenthesis mismatch is hard to recover
from, so it may be indicated as a problem in a broad block of code.
