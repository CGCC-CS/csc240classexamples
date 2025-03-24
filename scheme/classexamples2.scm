#lang scheme

"Code vs data"
(+ 2 3)        ; Scheme form to be evaluated
'(+ 2 3)       ; Scheme list, not evaluated due to the quote
'(+ 2 (+ 3 4)) ; Also true for nested S-expressions
null

(define x 10)

(newline)
"What is lambda?"
+
car
(lambda (x) (+ x 1))      ; evaluates to a procedure with no name
((lambda (x) (+ x 1)) 3)  ; use the lambda form as the operator
(define increment         ; define gives a name              
  (lambda (x)
    (+ x 1)))
increment
(increment 10)
((λ (x) (* x x)) 5)       ; Ctrl-\ to get a lambda character (λ)

(newline)
"Defining lists"
(define lst1 '(1 2 3 4))
(define lst2 (cons 'a '(b c d)))
(define lst3 (list 'w 'x 'y 'z))
(define lst4 (list 'w x 'y 'z))
(define lst5 (cons '(7 8) '(9 10)))
(define lst6 (append '(7 8) '(9 10)))
(define lst7 (cons 7 (cons 8 (cons 9 (cons 10 '())))))
lst1
lst2
lst3
lst4
lst5
lst6
lst7

(newline)
"cons vs append"
(cons 0 lst1)
;(append 0 lst1)    ; contract violation - append takes 2 lists as parameters
(cons lst1 lst2)
(append lst1 lst2)

(newline)
"Defining list procedure"
lst1
lst2
lst6
null   ; The empty list ()

(newline)
; A list procedure that returns a single value
"Sum up a list"
(define sum-list
  (lambda (lst)
    (if (null? lst)
        0   ; this is our base case - an empty list sums to 0
        (+ (car lst) (sum-list (cdr lst))))))
(sum-list '(1 2))
(sum-list lst1)
(sum-list lst6)
(sum-list (cons 7 lst1))
(+ (sum-list lst6)
   (sum-list (cons 4 lst1))
   (+ 5 (length lst3)))

(newline)
; A list procedure that returns a list
"Add n to every element of a list"
(define add-n-to-list
  (lambda (lst n)
    (if (empty? lst)  ; an empty list is null, so you can use either empty? or null?
        '()           ; this is our base case - an empty list means we return an empty list
        (cons (+ n (car lst)) (add-n-to-list (cdr lst) n)))))
(add-n-to-list lst1 3)
(add-n-to-list lst6 -10)
(add-n-to-list (cons 7 lst1) (cadr lst6))
;(add-n-to-list 10 3) ; first parameter has to be a list


(newline)
; A list procedure that returns a differently-sized list
"remove the ood numbers from a list"
(define even?   ; this is a helper function
  (lambda (x)
    (= (modulo x 2) 0)))   ; can use modulo or remainder
(even? -3)
(even? -4)
(even? 17)
(even? 42)

(define remove-odds
  (lambda (lst)
    (cond
      ((empty? lst) '())    ; base case
      ((even? (car lst))    ; if even, keep it
         (cons (car lst) (remove-odds (cdr lst))))
      (else (remove-odds (cdr lst)))))) ; do not add odds back to the list
lst1
(remove-odds lst1)
lst6
(remove-odds lst6)
(remove-odds '(1 3 5 7))
(remove-odds (append lst1 lst6))

(newline)
; A list procedure that returns a boolean
"Are two lists equal"
(define list-equal?
  (lambda (lst1 lst2)
    (cond
      ((and (null? lst1) (null? lst2)) #t)
      ((or (null? lst1) (null? lst2)) #f)   ; they aren't both emtpty here
      ((equal? (car lst1) (car lst2)) (list-equal? (cdr lst1) (cdr lst2)))
      (else #f))))
  lst1
(list-equal? lst3 lst3)
(list-equal? lst1 '(1 2 3 4))
(list-equal? lst1 '(4 3 2 1))
(list-equal? lst1 (cons 1 (cons 2 (cons 3 (cons 4 '())))))
(list-equal? '((1 2) 3) '((1 2) 3))

(newline)
"What is a list?"

(newline)
"What is a list?"
lst1
(list? lst1)
(list? (append lst1 (cons 5 (cons 6 lst5))))
(list? (cons 0 lst1))
(list? (cons lst1 (list 0)))
(list? '())
(list? (cons lst1 0))
(list? (cons 'x '()))
(list? (cons 'x '(y)))
(list? (cons 'x 'y))

(newline)
"What's going on here?"
(define proper (list 1 2))
(define improper (cons 1 2))

(newline)
"Pairs - (x . y)"
(pair? lst1)
(pair? (append lst1 (cons 5 (cons 6 lst5))))
(pair? (cons 0 lst1))
(pair? (cons lst1 0))
(pair? (cons lst1 (list 0)))
(pair? '())
(pair? (cons 'x '()))
(pair? (cons 'x 'y))

(newline)
"list vs pair"
(car '(1 2))
(cdr '(1 2))
(car '(1 . 2))
(cdr '(1 . 2))
(car '(a))
(cdr '(a))
;(car '()) ; not allowed - contract violation
;(cdr '()) ; car & cdr are PAIR operations, () is a list, not a pair

(newline)
"pair procedures"
"Are the elements of the pair in order?"
(define in-order-pair?
  (lambda (pr)
    (<= (car pr) (cdr pr))))
(in-order-pair? '(3 . 20))
(in-order-pair? '(4 . 2))
(in-order-pair? '(7 . 7))

"Raise the first element to the power of the second element"
(define raise-to-power
  (lambda (pr)
    (expt (car pr) (cdr pr))))
(raise-to-power '(3 . 20))
(raise-to-power '(4 . 2))
(raise-to-power '(7 . 7))

"Multiply each element of a list by a number"
; multiply each element of a list (car pr) by a number (cdr pr)
(define multiply-by
  (lambda (pr)  ; ' imput is pair of a list & an integer ((1 2 3 4) . 4)
    (if (null? (car pr))
        '()
        (cons (* (caar pr) (cdr pr)) (multiply-by (cons (cdar pr) (cdr pr)))))))
(multiply-by '((7 12 9 3) . 4))
