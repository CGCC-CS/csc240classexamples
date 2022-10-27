#lang scheme
; Project 4 test module
; YOU SHOULD NOT MODIFY THIS FILE!  If one of your functions does not work
; comment out the call to the test module in your code.
; Your code will be tested with a similar module

(provide test-remove-next-to-last)
(provide test-manhattan)
(provide test-remove-dups)
(provide test-deep-search)
(provide test-inorder)
(provide test-tree-exists)
(provide test-eval-poly)
(provide test-get-poly-fun)

(display "Fall 2022 Test Cases")

(define test-remove-next-to-last
  (lambda (x)
  (begin
    (display "Question 1: remove-next-to-last: ")
    (write (x '(l a s x t)))(display " & ")
    (write (x '(o n x e)))
    (newline)
    )))

(define test-manhattan
  (lambda (x)
  (begin
    (display "Question 2: manhattan: ")
    (write (x '(-1 . 4) '(1 . 8))) (display " & ")
    (write (x '(-4 . -3) '(6 . 3))) (display " & ")
    (write (x '(-2 . -2) '(5 . 5)))
    (newline)
    )))
   
(define test-remove-dups
  (lambda (x)
  (begin
    (display "Question 3: remove-dups: ")
    (write (x '(w o r k s)))(display " & ")
    (write (x '(p p p p e e e r r r r r f f f f f e e e e c c c t t t t)))(display " & ")
    (write (x '(T T T T T T T T T T T)))
    (newline))))

(define test-deep-search
  (lambda (x)
  (begin
    (display "Question 4: deep-search ")
    (write (x 2 2))(display " & ")
    (write (x '(1 2 3 4 5) 3))(display " & ")
    (write (x '(1 2 3 4 5) 7))(display " & ")
    (write (x '(1 (2 (3) 4 5)) 4))(display " & ")
    (write (x '(a (b (c (d (e))))) 'e))(display " & ")
    (write (x '(1 (2 (3 4)) (5) ((6 7 (8))) 9) 13))
    (newline)
    )))

(define tree1 '( (1 . 3) . ((4 . 5) . (8 . 9)) ))
(define tree2 '((1 . (2 . 3)) . (((4 . 6) . 7) . (8 . (9 . 10)))))

(define test-inorder
  (lambda (x)
    (begin
      (display "Question 5: inorder: ")
      (write (x tree1))(display " & ")
      (write (x tree2))
      (newline)
      )))

(define test-tree-exists
  (lambda (x)
    (begin
      (display "Question 5: tree-exists: ")
      (write (x tree1 5))(display " & ")
      (write (x tree1 10))(display " & ")
      (write (x tree2 5))(display " & ")
      (write (x tree2 10))
      (newline)
      )))

(define test-eval-poly
  (lambda (x)
    (let ((poly1 '((1 . 1) (1 . 1) (1 . 0)))
          (poly2 '((1 . 4) (-3 . 2) (3 . 1) (6 . 0)))
          (poly3 '((1 . 4) (2 . 3) (1 . 2) (3 . 1) (5 . 0))))
      (begin
        (display "Question 6a: eval-poly: ")(newline)
        (display "  Poly1: ")
        (write (x poly1 1))(display " & ")
        (write (x poly1 -2))(display " & ")
        (write (x poly1 4))
        (newline)
        (display "  Poly2: ")
        (write (x poly2 1))(display " & ")
        (write (x poly2 -2))(display " & ")
        (write (x poly2 4))
        (newline)
        (display "  Poly3: ")
        (write (x poly3 1))(display " & ")
        (write (x poly3 -2))(display " & ")
        (write (x poly3 4))
        (newline)
        ))))

(define  test-get-poly-fun
  (lambda (x)
    (let ((poly1 '((1 . 1) (1 . 1) (1 . 0)))
          (poly2 '((1 . 4) (-3 . 2) (3 . 1) (6 . 0)))
          (poly3 '((1 . 4) (2 . 3) (1 . 2) (3 . 1) (5 . 0))))
      (let
          ((f1 (x poly1))
           (f2 (x poly2))
           (f3 (x poly3)))
        (begin
          (display "Question 6a: get-poly-fun: ")
          (write (x poly1))(display " & ")
          (write (x poly2))
          (newline)
          (display "  f1: ")
          (write (f1 1))(display " & ")
          (write (f1 -2))(display " & ")
          (write (f1 4))(newline)
          (display "  f2: ")
          (write (f2 1))(display " & ")
          (write (f2 -2))(display " & ")
          (write (f2 4))(newline)
          (display "  f3: ")
          (write (f3 1))(display " & ")
          (write (f3 -2))(display " & ")
          (write (f3 4))
          (newline)
          )))))