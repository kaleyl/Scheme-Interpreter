# Scheme Interpreter (Fall 2019 CS61A)
Developed an interpreter for a subset of the Scheme language using Python.

(Source:https://inst.eecs.berkeley.edu/~cs61a/fa19/proj/scheme/)
Implementation overview
Here is a brief overview of each of the Read-Eval-Print Loop components in our interpreter. Refer to this section as you work through the project as a reminder of how all the small pieces fit together!

Read: This step parses user input (a string of Scheme code) into our interpreter's internal Python representation of Scheme expressions (e.g. Pairs).

Lexical analysis has already been implemented for you in the tokenize_lines function in scheme_tokens.py. This function returns a Buffer (from buffer.py) of tokens. You do not need to read or understand the code for this step.
Syntactic analysis happens in scheme_reader.py, in the scheme_read and read_tail functions. Together, these mutually recursive functions parse Scheme tokens into our interpreter's internal Python representation of Scheme expressions. You will complete both functions.
Eval: This step evaluates Scheme expressions (represented in Python) to obtain values. Code for this step is in the main scheme.py file.

Eval happens in the scheme_eval function. If the expression is a call expression, it gets evaluated according to the rules for evaluating call expressions (you will implement this). If the expression being evaluated is a special form, the corresponding do_?_form function is called. You will complete several of the do_?_form functions.
Apply happens in the scheme_apply function. If the function is a built-in procedure, scheme_apply calls the apply method of that BuiltInProcedure instance. If the procedure is a user-defined procedure, scheme_apply creates a new call frame and calls eval_all on the body of the procedure, resulting in a mutually recursive eval-apply loop.
Print: This step prints the __str__ representation of the obtained value.
Loop: The logic for the loop is handled by the read_eval_print_loop function in scheme.py. You do not need to understand the entire implementation.
Exceptions. As you develop your Scheme interpreter, you may find that Python raises various uncaught exceptions when evaluating Scheme expressions. As a result, your Scheme interpreter will halt. Some of these may be the results of bugs in your program, but some might just be errors in user programs. The former should be fixed by debugging your interpreter and the latter should be handled, usually by raising a SchemeError. All SchemeError exceptions are handled and printed as error messages by the read_eval_print_loop function in scheme.py. Ideally, there should never be unhandled Python exceptions for any input to your interpreter.

