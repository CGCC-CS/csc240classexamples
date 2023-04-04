#lang scheme

(define lst (list 1 2 3 4 5))

(define square
  (lambda (x)
    (* x x)))

"Shortcuts for car/cdr"
(car lst)
(cdr lst)
(car (cdr lst))
(cadr lst)
(car (cdr (cdr lst)))
(caddr lst)

(newline)
"Higher-order Functions"

(newline)
"apply, map, & filter"
lst
(apply + lst)
(apply * lst)
(map square lst)
(map (lambda (x) (+ x 3)) lst)
(map (lambda (x) (/ x 2)) lst)
(define crazylist (list 1 'a '(2 3 4) 5 'six (+ 3 4) "Eight" 9 (/ 40 4) square))
crazylist
(map number? crazylist)
(map (lambda (x) (not (number? x))) crazylist)
(filter number? crazylist)
(filter (lambda (x) (not (number? x))) crazylist)
"combining apply, map, filter"
(map square (filter number? crazylist))
(apply + (map square (filter number? crazylist)))

"procedure to remove non-multiples of a number from a list"
(define remove-non-mults
  (lambda (lst x)
    (filter (lambda (n) (= 0 (remainder n x))) lst)))
(remove-non-mults lst 2)
(remove-non-mults (filter number? crazylist) 5)

(newline)
"Reuce"
(define add-lst
  (lambda (lst)
    (if (null? lst)
        0
        (+ (car lst) (add-lst (cdr lst))))))
(add-lst lst)
(define red
  (lambda (operator base-case lst)
    (if (null? lst)
        base-case
        (operator (car lst) (red operator base-case (cdr lst))))))
lst
"Sum the list"
(red + 0 lst)
"Multiply the list"
(red * 1 lst)
"Halve every element in the list"
(define halve (lambda (x) (/ x 2)))
(red (lambda (carval cdrval) (cons (halve carval) cdrval)) '() lst)
"Double every element in the list"
(red (lambda (carval cdrval) (cons (* 2 carval) cdrval))'() lst)
"Length of a list"
(red (lambda (carval cdrval) (+ 1 cdrval)) 0 lst)
(red (lambda (carval cdrval) (+ 1 cdrval)) 0 '(a b c d e f g h i j k l))
"Get all even numbers"
(red (lambda (carval cdrval) (if (even? carval) (cons carval cdrval) cdrval)) '() lst)
"Reverse a list"
(red (lambda (carval cdrval) (append cdrval (list carval))) '() lst)
(red (lambda (carval cdrval) (append cdrval (list carval))) '() '(a b c d e f g h i j k l))

(newline)
"Reduce2"
(define red2
  (lambda (combine operator base-case lst)
    (if (null? lst)
        base-case
        (combine (operator (car lst)) (red2 combine operator base-case (cdr lst))))))
"Halve every element in the list"
(red2 cons halve '() lst)
"Double every element in the list"
(red2 cons (lambda (x) (* 2 x)) '() lst)
"length of a list"
(red2 + (lambda (x) 1) 0 lst)
(red2 + (lambda (x) 1) 0 '(a b c d e f g h i j k l))
"Reverse a list"
(red2 (lambda (carval cdrval) (append cdrval (list carval))) (lambda (x) x) '() lst)

