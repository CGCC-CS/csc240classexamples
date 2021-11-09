#lang scheme
"Scheme Review"

(define x 5)
(define y -3)
(define z 12)

(+ x y z)
(* (+ x 4) (* y z) (- x y))

(define square
  (lambda (x)
    (* x x)))
(square 10)
(square x)
(square (* x z))

"Lists"
(list 1 2 3 4)
(quote (a b c d))
(list x y z +)
(list 'x y z '+)
(quote (x y z +))
(define lst (list 1 2 3 4 5))
(car lst)
(cdr lst)
(cons 0 lst)
(cons '(1 2 3) '(4 5 6))
(append '(1 2 3) '(4 5 6))

(newline)
"Pairs"
(cons 1 2)
(define pr '(a . b))
(car pr)
(cdr pr)
(cons 3 '())
(cons 'm '(n o p))

(newline)
"Example list procedures"
(define add-list
  (lambda (x)
    (if (null? x)
        0
        (+ (car x) (add-list (cdr x))))))
(add-list '(10 37 39))
(add-list lst)

(define halve-each-element
  (lambda (lst)
    (if (null? lst)
        '()
        (cons (/ (car lst) 2) (halve-each-element (cdr lst))))))
(halve-each-element '(37 89 42 28))
(halve-each-element lst)

(newline)
"Higher-order function"
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
"Double every element in the list"
(red (lambda (carval cdrval) (cons (* 2 carval) cdrval)) '() lst)
"Length of a list"
(red (lambda (x y) (+ 1 y)) 0 lst)
(red (lambda (x y) (+ 1 y)) 0 '(a b c d e f g h i j))
"Get all even numbers"
(red (lambda (carval cdrresult) (if (= 1 (remainder carval 2)) cdrresult (cons carval cdrresult))) '() lst)
"Reverse a list"
(define rev
  (lambda (lst)
    (red (lambda (x y) (append y (list x))) '() lst)))
(rev lst)
(rev '(a b c d e f g h i j k l m n o p))

(newline)
"apply, map, filter"
(apply + lst)
(apply * lst)
(map square lst)
(map (lambda (x) (+ x 3)) lst)
(map (lambda (x) (/ x 2)) lst)
(define crazylist (list 1 'a '(2 3 4) 5 'six (+ 3 4) "Eight" 9 (/ 40 4)))
(map number? crazylist)
(filter number? crazylist)
(map square (filter number? crazylist))
(apply + (map square (filter number? crazylist)))

(newline)
"let structures"
(define a 3)
(define b 5)
(let
    ((a 10)
     (b 11)
     (c 12))
  (+ a b c))
(let
    ((a 7)
     (b (+ a 4))
     (c (- b 5)))
  (+ a b c))


(define double-pi-list
  (lambda (lst)
    (let
        ((double (lambda (x) (* 2 x)))
         (pi 3.14159))
      (if (null? lst)
          '()
          (cons (* pi (double (car lst))) (double-pi-list (cdr lst)))))))
(double-pi-list lst)
(double-pi-list (filter number? crazylist))

"let -> lambda"
(let
    ((a 20)
     (b 10))
  (+ a b))
((lambda (a b) (+ a b)) 20 10)

((lambda (m n) (- m n)) 35 17)
(let
    ((m 35)
     (n 17))
  (- m n))

(newline)
"Currying"
(define increment-creator
  (lambda (x)
    (lambda (y)
      (+ x y))))
(increment-creator 1)
((increment-creator 1) 3)

(define increment
  (lambda (n)
    ((increment-creator 1) n)))
(define add10
  (lambda (n)
    ((increment-creator 10) n)))
(increment 7)
(map increment lst)
(add10 7)
(map add10 lst)

; f(x) = ax^2 + bx + c
(define f
  (lambda (a b c)
    (lambda (x)
      (+ (* a x x) (* b x) c))))
"f(x) = x^2 + x + 1"
(f 1 1 1)
((f 1 1 1) 3)
"f(x) = 2x^2 + 3x - 5"
((f 2 3 -5) 3)
((f 2 3 -5) -1)
((f 2 3 -5) 10)

