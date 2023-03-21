#lang scheme

; comments start with a ;

"strings, numbers evaluate to themselves"
10
3.4

; symbols
'y
'(+ 3 4)

(define x 10)
(+ 7 4)
(* 5 x)

+

(newline)  ; here to clean up the output
"defining a function"
(+ 10 x)                   ; Scheme form - add 10 & x
(lambda (x) (+ 10 x))      ; Lambda - evaluates to a function that adds 10 to the parameter
((lambda (x) (+ 10 x)) 7)  ; Scheme form - apply function to parameter 7
(define add-10             ; Give the function a name
  (lambda (x)
    (+ 10 x)))
(add-10 8)


(newline)
"Lists"
(list 1 2 3 4)
'(a b c d thisisalist)
(define lst '(10 20 7 8))
(car lst)    ; first element in the list
(cdr lst)    ; list with first element removed
(car '(x y z))
(cdr '(l m n o p))
(cons 0 '(1 2 3 4))  ; add as first element of the list
(cons 'w '(x y z))
(cons lst '(q r s))
