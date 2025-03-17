#lang scheme

; comments start with ;

"Literals"
3      ; integer literal
#b101  ; binary literal
42/5   ; fraction literal
3+2i   ; complex literals

"Strings, numbers and other literals evaluate to themselves"
10
"The number is 20"
3.14

"Scheme evaluates forms"
(+ 3 4)

(newline) ; this is just to clean up output, normally you do not need this

"Simple arithmetic"
(+ 1 7)
(* 3 7)
(+ 1 2 3)
(+ 42 9 345 2 34 4 2 8 7 6 5 87)
(* 10000 10000 437843784343 4432432433 2432432 14 3 484324324233 384324322 40 30)
(/ 20 3)
(/ 20 3.0)
(expt 2 5)
(expt 25 1/2)
(+ (* 3 3) (- 75 (/ 125 5)) (* 7 (- 8 5)))

(newline)
"Atoms"
1        ; integers
3.14159  ; decimals
"Scheme" ; strings
'Prolog  ; symbols
227/19   ; fractions

(newline)
"Symbols"
'y
'thisisasymbol

'(+ 3 4) ; the quote tells Scheme not to evaluate the form

(newline)
"'define' associates a name with a value"
(define x 10)
x

(define a 10)             ; associate the name a to the integer 10
(define y 17)
(define class "CSC240")   ; associate the name class to the string "CSC240"
(define subject 'Scheme)  ; associate the name subject to the symbol 'Scheme
(* 5 a)
a
y
class
subject
x

"Preventing evaluation of a defined name with a quote"
'x     ; the ' (quote) tells Scheme not to evaluate the form

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
"(+ 10 x) vs (lambda (x) (+ 10 x))"
(+ 10 x)                   ; Scheme form: evaulate 10 + x (x must also be evaluated)
(lambda (x) (+ 10 x))      ; lambda: evaluates to a function that adds 10 to a parameter
((lambda (x) (+ 10 x)) 7)  ; Scheme form: apply function to parameter 7

"Lambdas - unnamed functions"
(lambda (x) (+ x 1))
((lambda (x) (+ x 1)) 10)
((lambda (x) (+ x 1)) -42)
((lambda (x) (+ x 1)) a)
((lambda (x) (+ x 1)) (+ 6 3))
((lambda (x) (+ x 1)) (* 7 (- (* 4 5) (* 2 3))))

(newline)
"Giving a function a name"
(define increment (lambda (x) (+ x 1)))
increment
(increment 10)
(increment -42)
(increment a)
(increment (+ 7 8))
(increment (* 7 (- (* 4 6) (* 2 3))))
;(increment)  ; arity mismatch! - wrong number of parameters

(newline)
"Defining a function"
(define add-10           ; gives the lambda a name
  (lambda (x)
    (+ 10 x)))
(add-10 8)
(add-10 a)
(add-10 (* (- 17 13) (/ 70 10)))


(newline)
"Define a min function"
(define min
  (lambda (a b)
    (if (> b a)
        b
        a)))
(min 3 4)
(min 4 3)
(min (+ 3 10) (- 20 10))

(newline)
"Lists"
(list 1 2 3 4)
'(1 2 3 4)
(quote (1 2 3 4))

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
"Accessing individual elements of a list with car & cdr"
lst
(car lst)
(car (cdr lst))
(car (cdr (cdr lst)))
(car (cdr (cdr (cdr lst))))

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
(car (cdr (car (cdr emlst))))
(car (cdr (cdr (cdr emlst))))
(car (car (cdr (cdr emlst))))
(cdr (car (cdr (cdr emlst))))
(car (cdr (car (cdr (cdr emlst)))))

(newline)
"List of procedures"
(define procs (list sqrt increment list))
procs
(car procs)    ; sqrt
(cadr procs)   ; increment
(caddr procs) ; list