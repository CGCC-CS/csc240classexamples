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

(newline)
"Let structures"
(define a 3)
(define b 5)
(let
    ((a 10)
     (b 11)
     (c 12))
  (+ a b c))

(let
    ((j 4)
     (k 7)
     (i 2))
  (+ j k (* i k) (- (* 3 k) j)))
 

(* a 4)
(square b)
((lambda (x) (if (> x 10) 10 x)) (+ a b))
(let
    ((x (* a 4))
     (y (square b))
     (z ((lambda (x) (if (> x 10) 10 x)) (+ a b))))
  (+ x (- y z)))

(let
    ((x 7)
     (double (lambda (x) (* x 2))))
  (double (+ (double a) (double x))))

"Using a let in a function definiton"
(define double-pi-list
  (lambda (lst)
    (let
        ((double (lambda (x) (* x 2)))
         (pi 3.14159))
      (if (null? lst)
          '()
          (cons (* pi (double (car lst))) (double-pi-list (cdr lst)))))))
(double-pi-list lst)
(double-pi-list (filter number? crazylist))

(define do-stuff
  (lambda (x)
    (let
        ((half (/ x 2))
         (twice (* x 2))
         (times *))
      (times half twice))))
(do-stuff 10)
(do-stuff (/ 3 7))

"Be careful with scope!"
(let
    ((a 7)
     (b (+ a 4))
     (c (- b 5)))
  (+ a b c))

(newline)
"let -> lambda"
(let
    ((a 20)
     (b 10))
  (+ a b))
((lambda (a b) (+ a b)) 10 20)

((lambda (m n) (- m n)) 35 17)
(let
    ((m 35)
     (n 17))
  (- m n))

(newline)
"Currying"
(define adder-creator
  (lambda (x)
    (lambda (y)
      (+ x y))))
"adder-creator 1"
(adder-creator 1)
((adder-creator 1) 42)
(define increment (adder-creator 1))
(increment 10)
(increment -17)
"adder-creator 10"
(adder-creator 10)
((adder-creator 10) 42)
(define add10 (adder-creator 10))
(add10 10)
(add10 -17)

"function to create a polynomial function"
; f(x) = ax^2 + bx + c
(define f
  (lambda (a b c)
    (lambda (x)
      (+ (* a x x) (* b x) c))))
"f(x) = x^2 + x + 1"
(f 1 1 1)
((f 1 1 1) 3)
((f 1 1 1) -2)
"f(x) = 2x^2 + 3x - 5"
((f 2 3 -5) 3)
((f 2 3 -5) -1)
((f 2 3 -5) 10)
(map (f 2 3 -5) lst)