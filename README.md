# Scheme Interpreter (Fall 2019 CS61A)
Developed an interpreter for a subset of the Scheme language using Python.

(Source:https://inst.eecs.berkeley.edu/~cs61a/fa19/proj/scheme/)
Implementation overview

Read: This step parses user input (a string of Scheme code) into our interpreter's internal Python representation of Scheme expressions (e.g. Pairs).

Eval: This step evaluates Scheme expressions (represented in Python) to obtain values. Code for this step is in the main scheme.py file.

Print: This step prints the __str__ representation of the obtained value.

Loop: The logic for the loop is handled by the read_eval_print_loop function in scheme.py. You do not need to understand the entire implementation.
