# 10/20/2026 6:00pm

This is the first log. I am starting this project 3 days out from its due date, and plan to use it as my sample program for the fuzzer implementation questions on the homework that is also due in 3 days. I know it must be written in the functional language Racket. My general plan is to construct an outline for the program (what generally needs to happen for the calculator to work), and then to incrementally work on each section, interleaving work on aspects of functionality as needed. I know Racket is already prefix, so I don't think I'll need to do any conversions to infix, as the the requirements state that the only output should be the result of the expressions, not a rewrite of the expression to infix or anything like that. I know history must be kept, and error handling on inputs are also requirements. I suppose I could already break down the project into simple calculator functionality, history keeping, and error handling (which I may intentionally do last so that I can use a working, albeit buggy, prototype for my fuzzer implementations.)

# 10/20/2026 7:05pm

I committed the devlog, synced the GitHub repo with the git repo for a particular directory on my machine, created a calc.rkt file which I intend to use for the whole program, added the mode-detection code to said file (commented out for now), and also added the sample-runs directory to the repo.

# 10/23/2026 10:47pm

It is grind time. My schedule restraints and procrastination problem has led me into a sticky situation. I will try my best to finish this project tonight. My current plan is as follows: code the loop, quit, mode, and EOF handling. Then add number parsing and addition and multiplication. Then division, unary '-', and text checks. Then history. Finally error handling. I will then test with some sample runs, update the README, and hopefully have everything submitted in time.

# 10/23/2026 10:53pm

First up is the loop and mode. The mode is just pasted from the professor. The loop is the starting point for the actual base of the program. I know the history must be apart of it.

# 10/23/2026 10:57pm

Loop skeleton done.

# 10/23/2026 11:00pm

Time for number parsing. I will need to skip whitespace, input digits, parse numbers, and evaluate.

# 10/23/2026 11:25pm

I am stressing. Things seem to work so far but I need to finish before the deadline.

# 10/23/2026 11:31pm

I finished adding everything for number parsing but now need to add the operators and history still. Seems straightforward but I need to work quickly.
