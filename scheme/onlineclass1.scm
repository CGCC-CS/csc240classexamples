#lang scheme

; Scheme comments start with a semi-colon

(newline)
"Literals"
3     ; integer literal
#b101 ; binary literal
42/5  ; fraction literal
3+2i  ; imaginary literal

(newline)
"Simple arithmetic"
(+ 1 7)
(* 8 8)
(+ 1 2 3)
(+ 42 9 345 2 34 4 2 8 7 6 5 87)
(* 10000 10000 437843784343 4432432433 2432432 14 3 484324324233 384324322 40 30)
(/ 20 3)
(/ 20 3.0)
(expt 2 5)
(expt 25 (/ 1 2))

(newline)
"Atoms"
1           ; integer
3.14159     ; decimal
"Scheme"    ; string
'Prolog     ; symbol
227/19      ; fraction

(newline)
"Defining names"
(define a 10)             ; associate the name a to the integer 10
(define class "CSC240")   ; associate the name class to the string "CSC240"
(define subject 'Scheme)  ; associate the name subject to the symbol 'Scheme
a
class
subject

(newline)
"Predicates"
"number? examples"
(number? 8)
(number? a)
(number? class)
(number? subject)
"string? examples"
(string? "This is a string")
(string? a)
(string? class)
(string? subject)
"symbol? examples"
(symbol? 'ThisIsASymbol)
(symbol? a)
(symbol? class)
(symbol? subject)

(newline)
"Lambdas - unnamed functions"
+
(lambda (x) (+ x 1))
((lambda (x) (+ x 1)) 10)
((lambda (x) (+ x 1)) -42)
((lambda (x) (+ x 1)) (+ 7 8))
((lambda (x) (+ x 1)) a)
((lambda (x) (+ x 1)) (* 7 (- (* 4 6) (* 3  2))))

(newline)
"Giving a function a name"
(define increment (lambda (x) (+ x 1)))
increment
(increment 10)
(increment -42)
(increment (+ 7 8))
(increment a)
(increment (* 7 (- (* 4 6) (* 3  2))))
;(increment)  ; error: arity mismatch!

(newline)
"Defining a min function"
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

(newline)
"list vs quote"
(list a 1 'hello "World" (* 2 7) / 30)
'(a 1 'hello "World" (* 2 7) / 30)
(quote (a 1 'hello "World" (* 2 7) / 30))
(list a 'b (quote c))  ; (list a b c) gives an error, so b & c must be quoted
(quote (a b c))

(newline)
"Define a list (associate a name to a list)"
(define lst '(a b c d))
(define lst2 (list a 'b 'c (quote d)))
lst
lst2

(newline)
"List primitives"
(car lst)      ; first element in the list
(cdr lst)      ; list with first element removed
(cons 0 lst)   ; add as first element of the list

(cons lst '(e f g h i))
(append lst '(e f g h i))

(newline)
"Accessing indificual elements of a list with car & cdr"
(car lst)
(car (cdr lst))
(car (cdr (cdr lst)))
(car (cdr (cdr (cdr lst))))
(cdr (cdr (cdr (cdr lst))))

"Shortcuts"
(car lst)
(cadr lst)
(caddr lst)
(cadddr lst)
(cddddr lst)

"Accessing members of embedded lists"
(define emlst '(1 (a b) (2 (3 4) 5) (c d (e f))))
emlst
(length emlst)
(car (cdr emlst))        ; second element in list
(car (car (cdr emlst)))
(cdr (car (cdr emlst)))
(car (cdr (cdr emlst)))  ; third element in list
(car (car (cdr (cdr emlst))))
(cdr (car (cdr (cdr emlst))))
(car (cdr (car (cdr (cdr emlst)))))

(newline)
"List of procedures"
(define procs (list sqrt increment list))
procs
(car procs)    ; sqrt
(cadr procs)   ; increment
(caddr procs)  ; list
((car procs) 25)
((cadr procs) 17)
((caddr procs) 1 2 (/ 6 2) a 'b 'c "Scheme")