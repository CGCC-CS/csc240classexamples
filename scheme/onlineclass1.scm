#lang scheme

; Scheme comments start with a semi-colon
(+ 1 7)
(* 8 8)
(+ 1 2 3)
(+ 42 9 345 2 34 4 2 8 7 6 5 87)
(* 10000 10000 437843784343 4432432433 2432432 14 3 484324324233 384324322 40 30)

; Atoms
1           ; integer
"Scheme"    ; string
'Prolog     ; symbol
227/19      ; fraction

; Defining names
(define a 10)
(define class "CSC240")
(define subject 'Scheme)
a
class
subject

(newline)
"Predicates"
(string? subject)
(string? class)
(symbol? subject)
(number? a)
(number? (+ 3 10))
(number? class)


(newline)
"Literals"
3     ; integer literal
#b101 ; binary literal
42/5  ; fraction literal
3+2i  ; imaginary literal

(newline)
"Functions"
(lambda (x) (+ x 1))
((lambda (x) (+ x 1)) 30)
((lambda (x) (+ x 1)) -42)
((lambda (x) (+ x 1)) (+ 7 8))
((lambda (x) (+ x 1)) a)
((lambda (x) (+ x 1)) (* 7 (- (* 4 6) (* 3  2))))

(newline)
"Giving a function a name"
(define increment (lambda (x) (+ x 1)))
increment
(increment 30)
(increment -42)
(increment (+ 7 8))
(increment a)
;(increment)  ; error!

"min"
(define min
  (lambda (a b)
    (if (> b a)
        a
        b)))
(min 3 4)
(min 4 3)
(min (+ 3 10) (- 20 10))

(newline)
"Lists"
(list 1 2 3 4)
'(1 2 3 4)
(quote (1 2 3 4))

"list vs quote"
(list a 1 'Hello "World" + (* 2 7))
(quote (a 1 'Hello "World" + (* 2 7)))

"Defining lists"
(define lst '(a b c d))
(define lst2 (list a 'b 'c 'd))
lst
lst2

"List primitives"
(car lst)
(cdr lst)
(cons 0 lst)

(cons lst '(-4 -3 -2 -1 0))
(append lst '(-4 -3 -2 -1 0))

"Accessing elements of a list with car & cdr"
(car lst)
(car (cdr lst))
(cdr (cdr lst))
(car (cdr (cdr lst)))
(cdr (cdr (cdr lst)))
(car (cdr (cdr (cdr lst))))

(newline)
"List of procedures"
(define procs (list sqrt increment list))
procs
(car procs)
((car procs) 25)
((car (cdr procs)) 25)
((car (cdr (cdr procs))) 25)