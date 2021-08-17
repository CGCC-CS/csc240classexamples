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

"Pairs"
(cons 1 2)
(define pr '(a . b))
(car pr)
(cdr pr)
(cons 3 '())

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
(halve-each-element '(37 89 44 28))
(halve-each-element lst)

(newline)
"Higher-order functions"
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
"Double every element in a list"
(red (lambda (carval cdrval) (cons (* 2 carval) cdrval)) '() lst)
"Length"
(red (lambda (x y) (+ 1 y)) 0 lst)
(red (lambda (x y) (+ 1 y)) 0 '(1 2 3 4 5 6 7 8 9 10))
"Get all even numbers"
(red (lambda (x y) (if (= 1 (remainder x 2)) y (cons x y))) '() lst)
"Reverse"
(red (lambda (x y) (append y (list x))) '() '(a b c d e f g h i))
(red (lambda (x y) (append y (list x))) '() lst)

(newline)
"apply, map, filter"
(apply + lst)
(apply * lst)
(map square lst)
(map (lambda (x) (+ x 3)) lst)
(map (lambda (x) (/ x 2)) lst)
(map number? '(1 a '(2 3 4) 5 'six (+ 3 4) "Eight" 9 (/ 40 4)))
(filter number? '(1 a '(2 3 4) 5 'six (+ 3 4) "Eight" 9 (/ 40 4)))
(filter number? (list 1 'a '(2 3 4) 5 'six (+ 3 4) "Eight" 9 (/ 40 4)))

(map square (filter number? (list 1 'a '(2 3 4) 5 'six (+ 3 4) "Eight" 9 (/ 40 4))))

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
    ((x 7)
     (y 2))
  (+ x y 10))

; Be carefull!
(let
    ((a 5)
     (b (+ a 1)))  ; bad coding style!!!
  (+ a b))

(define double-pi-list
  (lambda (lst)
    (let
        ((double (lambda (x) (* 2 x)))
         (pi 3.14159))
      (if (null? lst)
          '()
          (cons (* pi (double (car lst))) (double-pi-list (cdr lst)))))))
(double-pi-list lst)

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
(define sum
  (lambda (x y)
    (+ x y)))
(define increment-creator
  (lambda (x)
    (lambda (y)
      (+ x y))))
(increment-creator 1)
((increment-creator 1) 3)

(define increment
  (lambda (n)
    ((increment-creator 1) n)))
(increment 7)

(define add10
  (lambda (n)
    ((increment-creator 10) n)))
(add10 7)
(map add10 '(7 4 38 89 103))

; f(x)=ax^2 + bx + c
(define f
  (lambda (a b c)
    (lambda (x)
      (+ (* a x x) (* b x) c))))

"f(x)=x^2 + x + 1"
(f 1 1 1)
((f 1 1 1) 3)
"f(x)=2x^2 + 3x - 5"
((f 2 3 -5) 3)
((f 2 3 -5) -1)
((f 2 3 -5) 10)

(newline)
"Exercise questions"
(define parens-depth
  (lambda (lst)
    (cond
      ((not (list? lst)) 0)
      ((null? lst) 1)
      (else (max (+ 1 (parens-depth (car lst))) (parens-depth (cdr lst)))))))
(parens-depth '(1 2 (3 4) (5 (6 (7 8) 9))))
(parens-depth 'deep)
(parens-depth '(1 2 3))