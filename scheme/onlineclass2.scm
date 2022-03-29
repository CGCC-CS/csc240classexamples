#lang scheme
(define x 3)

"Quoting"
(quote (1 x +))
'(1 x +)
(list 1 x +)
(+ 10 20)
'(+ 10 20)

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
"cons vs append)"
(cons 0 lst1)
;(append 0 lst1)  ; append takes lists as parameters
(append (list 0) lst1)
(cons lst1 lst5)
(append lst1 lst5)
(cons 0 (append lst1 lst5))

(newline)
"Defining list procedures"
lst1
lst2
lst6

"Add n to every element of a list"
(define add-n-to-list
  (lambda (lst n)
    (if (null? lst)
        '()
        (cons (+ n (car lst)) (add-n-to-list (cdr lst) n)))))
(add-n-to-list lst1 3)
(add-n-to-list lst6 -10)
(add-n-to-list lst1 (car (cdr lst6)))

"Sum up a list"
(define sum-list
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (sum-list (cdr lst))))))
(sum-list lst1)
(sum-list lst6)
(sum-list (cons 10 lst1))
(sum-list (add-n-to-list lst1 10))
(+ (sum-list lst1) (* 5 (length lst1)))

(newline)
"Remove the odd numbers"
(define odd?
  (lambda (x)
    (= (remainder x 2) 1)))
(define remove-odds
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((odd? (car lst)) (remove-odds (cdr lst)))
      (else (cons (car lst) (remove-odds (cdr lst)))))))
(remove-odds lst1)
(remove-odds lst6)
(remove-odds (append lst1 lst6))

(newline)
"Compare two lists"
(define list-equal?
  (lambda (lst1 lst2)
    (cond
      ((and (null? lst1) (null? lst2)) #t)
      ((or (null? lst1) (null? lst2)) #f)
      ((equal? (car lst1) (car lst2)) (list-equal? (cdr lst1) (cdr lst2)))
      (else #f))))
(list-equal? '(1 2 3 4) lst1)
(list-equal? lst1 '(4 3 2 1))
(list-equal? lst1 (cons 1 (cons 2 '(3 4))))

(newline)
"list?"
(list? lst1)
(list? (append lst1 (cons 5 (cons 6 lst5))))
(list? (cons 0 lst2))
(list? (cons lst1 5))
(list? (cons 5 lst1))
(list? (cons lst1 (list 5)))
(list? '())
(list? (cons 'x '()))
(list? (cons 'x 'y))

(newline)
"pair?"
(pair? lst1)
(pair? (append lst1 (cons 5 (cons 6 lst5))))
(pair? (cons 0 lst2))
(pair? (cons lst1 5))
(pair? (cons 5 lst1))
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
;(car '())
;(cdr '())

      