#lang scheme

(- -42)
null

(define x 3)

(newline)
"Quoting"
(+ x 1)
(quote (+ x 1))
'(+ x 1)
(list + x 1)
(list (+ x 1))

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
; (append 0 lst1) contract violation - append takes 2 lists as parameters
(append (list 0) lst1)
(cons lst1 lst5)
(append lst1 lst5)

(newline)
"Defining list procedures"
lst1
lst2
lst6

(newline)
; A list procedure that returns a list
"Add n to every element of a list"
(define add-n-to-list
  (lambda (lst n)
    (if (null? lst)
        '()
        (cons (+ n (car lst)) (add-n-to-list (cdr lst) n)))))
(add-n-to-list lst1 3)
(add-n-to-list lst6 -10)
(add-n-to-list (cons 7 lst1) (cadr lst6))
;(add-n-to-list 10 3)  ; first parameter has to be a list

(newline)
; A list procedure that returns single value
"Sum up a list"
(define sum-list
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (sum-list (cdr lst))))))
(sum-list lst1)
(sum-list lst6)
(sum-list (cons 7 lst1))
(sum-list (add-n-to-list lst1 12))
(+ (sum-list lst6) (sum-list (add-n-to-list (cons 4 lst1) 6)) (* 5 (length lst3)))

(newline)
; A list procdedure thats returns a differently sized list
"Remove the odd numbers from a list"
(define odd?
  (lambda (x)
    (not (= (remainder x 2) 0))))
(odd? -3)
(odd? 17)
(odd? 42)
(define remove-odds
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((odd? (car lst)) (remove-odds (cdr lst)))
      (else (cons (car lst) (remove-odds (cdr lst)))))))
(remove-odds lst1)
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
      ((or (null? lst1) (null? lst2)) #f)
      ((equal? (car lst1) (car lst2)) (list-equal? (cdr lst1) (cdr lst2)))
      (else #f))))
(list-equal? lst3 lst3)
(list-equal? lst1 '(1 2 3 4))
(list-equal? lst1 '(4 3 2 1))
(list-equal? lst1 (cons 1 (cons 2 (cons 3 (cons 4 '())))))

(newline)
"What is a list?"
lst1
(list? lst1)
(list? (append lst1 (cons 5 (cons 6 lst5))))
(list? (cons 0 lst2))
(list? (cons lst2 0))
(list? (cons 5 lst1))
(list? (cons lst1 5))
(list? (cons lst1 (list 5)))
(list? '())
(list? (cons 'x '()))
(list? (cons 'x 'y))

(newline)
"Pairs - (x . y)"
(cons 'x 'y)
(pair? lst1)
(pair? (append lst1 (cons 5 (cons 6 lst5))))
(pair? (cons 0 lst2))
(pair? (cons lst2 0))
(pair? (cons 5 lst1))
(pair? (cons lst1 5))
(pair? (cons lst1 (list 5)))
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
;(car '()) ; not allowed
;(cdr '()) ; car & cdr are PAIR operations, () is a list, not a pair

(newline)
"pair procedures"
(define in-order-pair?
  (lambda (pr)
    (>= (cdr pr) (car pr))))
(in-order-pair? '(3 . 20))
(in-order-pair? '(4 . 2))
(in-order-pair? '(7 . 7))

(define raise-to-power
  (lambda (pr)
    (expt (car pr) (cdr pr))))
(raise-to-power '(3 . 20))
(raise-to-power '(4 . 2))
(raise-to-power '(7 . 7))

(define multiply-by
  (lambda (pr)
    (if (null? (car pr))
        '()
        (cons (* (caar pr) (cdr pr)) (multiply-by (cons (cdar pr) (cdr pr)))))))

(multiply-by '((7 12 9 3) . 4))