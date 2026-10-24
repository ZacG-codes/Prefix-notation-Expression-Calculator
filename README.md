# Prefix-notation-Expression-Calculator

A prefix-notation calculator written in Racket, with a history of results.

## Files

- `calc.rkt` - the whole program
- `devlog.md` - development log
- `sample-runs/` - sample inputs and outputs
- `LICENSE` - license

## Running

Interactive mode (shows a `> ` prompt):

    racket calc.rkt

Batch mode (no prompt, only results and errors):

    racket calc.rkt -b
    racket calc.rkt --batch

Batch mode with a file of expressions:

    racket calc.rkt -b < sample-runs/input.txt

Type `quit` (exactly) to exit. End of input also exits.

## Expressions

- `+ a b` add, `* a b` multiply
- `/ a b` integer division (`quotient`), dividing by zero is an error
- `- a` negate (there is no subtraction, add a negative instead)
- `$n` the result with history id n (ids start at 1)
- numbers such as `3` or `2.5`

Whitespace between tokens is optional. Extra text after a complete expression is an error.
Every result is printed as `id: value` as a float. Errors print `Error: Invalid Expression`
and are not added to the history.
