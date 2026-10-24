#lang racket

; mode detection
(define prompt?
   (let [(args (current-command-line-arguments))]
     (cond
       [(= (vector-length args) 0) #t]
       [(string=? (vector-ref args 0) "-b") #f]
       [(string=? (vector-ref args 0) "--batch") #f]
       [else #t])))

; drop leading whitespace
(define (skip-ws chars)
  (cond
    [(null? chars) chars]
    [(char-whitespace? (car chars)) (skip-ws (cdr chars))]
    [else chars]))
 
; split leading digits and dots off, returns (list taken rest)
(define (take-digits chars)
  (cond
    [(null? chars) (list '() '())]
    [(or (char-numeric? (car chars)) (char=? (car chars) #\.))
     (let ([r (take-digits (cdr chars))])
       (list (cons (car chars) (car r)) (cadr r)))]
    [else (list '() chars)]))

; returns (list number rest)
(define (parse-number chars)
  (let* ([r (take-digits chars)]
         [n (string->number (list->string (car r)))])
    (if n
        (list n (cadr r))
        (error "bad number"))))

(define (parse-expr chars0 history)
  (let ([chars (skip-ws chars0)])
    (cond
      [(null? chars) (error "empty")]
      [(char-numeric? (car chars)) (parse-number chars)]
      [else (error "bad character")])))

(define (evaluate line history)
  (let ([r (parse-expr (string->list line) history)])
    (if (null? (skip-ws (cadr r)))
        (car r)
        (error "leftover text"))))


(define (eval-loop history)
  (when prompt?
    (display "> ")
    (flush-output))
  (let ([line (read-line (current-input-port) 'any)])
    (cond
      [(eof-object? line) (void)]
      [(string=? line "quit") (void)]
      [else
       (let ([result (with-handlers ([exn:fail? (lambda (e) #f)])
                       (evaluate line history))])
         (cond
           [result
            (display (+ 1 (length history)))
            (display ": ")
            (display (real->double-flonum result))
            (newline)
            (eval-loop (cons result history))]
           [else
            (displayln "Error: Invalid Expression")
            (eval-loop history)]))])))

(eval-loop '())
