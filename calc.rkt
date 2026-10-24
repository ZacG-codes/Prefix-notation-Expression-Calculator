#lang racket

; mode detection
(define prompt?
   (let [(args (current-command-line-arguments))]
     (cond
       [(= (vector-length args) 0) #t]
       [(string=? (vector-ref args 0) "-b") #f]
       [(string=? (vector-ref args 0) "--batch") #f]
       [else #t])))

; eval-loop
(define (eval-loop history)
  (when prompt?
    (display "> ")
    (flush-output))
  (let ([line (read-line (current-input-port) 'any)])
    (cond
      [(eof-object? line) (void)]
      [(string=? line "quit") (void)]
      [else (displayln "Error: Invalid Expression")
            (eval-loop history)])))
