#lang scheme
(define x 3)

"Quoting"
'(1 x +)
(list 1 x +)
'(+ 1 2)
(+ 1 2)
(quote (+ 1 2))

(newline)
"Defining lists"
(define lst1 '(1 2 3 4))
(define lst2 (cons 'a '(b c d)))
(define lst3 (list 'w 'x 'y 'z))
(define lst4 (list 'w x 'y 'z))
(define lst5 (append '(7 8) (cons 9 '(10))))
(define lst6 (cons '(7 8) (cons 9 '(110))))
(define lst7 (cons 10 (cons 20 (cons 30 '()))))
lst1
lst2
lst3
lst4
lst5
lst6
lst7

(newline)
"Creating new lists"
(cons 0 lst1)
(append lst1 lst5)
(append lst1 (cons 5 (cons 6 lst5)))

(newline)
"Defining list procedures"
lst1
lst5
"Add n to every element of a list"
(define add-n-to-list
  (lambda (lst n)
    (if (null? lst)    ; check if list = '()
        '()
        (cons (+ (car lst) n)  (add-n-to-list (cdr lst) n)))))
(add-n-to-list lst1 5)
(add-n-to-list lst5 -2)

"Sum up a list"
(define sum-list
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (sum-list (cdr lst))))))
(sum-list lst1)
(sum-list lst5)
(sum-list (append lst1 lst5))

(sum-list (add-n-to-list lst1 10))

"remove-odds"
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
(remove-odds lst5)
(remove-odds (append lst1 (cons 5 (cons 6 lst5))))

"Compare two lists"
(define list-equal?
  (lambda (lst1 lst2)
    (cond
      ((and (null? lst1) (null? lst2)) #t)
      ((null? lst1) #f)
      ((null? lst2) #f)
      ((equal? (car lst1) (car lst2)) (list-equal? (cdr lst1) (cdr lst2)))
      (else #f))))
(list-equal? '(1 2 3 4) lst1)
(list-equal? lst1 '(4 3 2 1))
(list-equal? lst1 lst2)
(list-equal? lst5 (add-n-to-list lst1 6))

(newline)
"list?"
(list? lst1)
(list? (append lst1 (cons 5 (cons 6 lst5))))
(list? (cons 0 lst1))
(list? (cons lst1 5))
(list? (cons lst1 (list 5)))
(list? '())
(list? (cons 'x '()))
(list? (cons 'x 'y))


(newline)
"pair?"
(pair? lst1)
(pair? (append lst1 (cons 5 (cons 6 lst5))))
(pair? (cons 0 lst1))
(pair? (cons lst1 5))
(pair? (cons lst1 (list 5)))
(pair? '())
(pair? (cons 'x '()))
(pair? (cons 'x 'y))