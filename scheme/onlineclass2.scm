#lang scheme

(define x 3)

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
(define lst4 (list 'w  x 'y 'z))
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
;(append 0 lst1)   ; contract violation - append takes 2 lists as parameters
(append (list 0) lst1)
(cons lst1 lst5)
(append lst1 lst5)
(cons 0 (append lst1 lst5))

(newline)
"Defining list procedures"
lst1
lst2
lst6

; A list procedure that returns a list
"Add n to everyelement of list"
(define add-n-to-list
  (lambda (lst n)
    (if (null? lst)
        '()
        (cons (+ n (car lst)) (add-n-to-list (cdr lst) n)))))
(add-n-to-list lst1 3)
(add-n-to-list lst6 -10)
(add-n-to-list (cons 7 lst1) (car (cdr lst6)))
; (add-n-to-list 10)  ; only works for lists!

; A list procedure that returns a atom
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
(+ (sum-list lst6) (sum-list (add-n-to-list (cons 4 lst1) 6)) (* 5 (length lst2)))