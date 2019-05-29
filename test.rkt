#lang racket

(define member?
  (lambda (a l)
    (cond
      ((null? l) #f)
      (else (or (eq? a (car l))
                (member? a (cdr l)))))))

(define multirember-aux
  (lambda (a l ans)
    (cond
      ((null? l) ans)
      ((eq? a (car l)) (multirember-aux a (cdr l) ans))
      (else
       (multirember-aux a (cdr l) (cons (car l) ans))))))

(define multirember
  (lambda (a l)
    (multirember-aux a l '())))

(define make-set-aux
  (lambda (l ans)
    (cond
      ((null? l) ans)
      ((member? (car l) ans) (make-set-aux (multirember (car l) l) ans))
      (else
       (make-set-aux (multirember (car l) l) (cons (car l) ans))))))

(define make-set
  (lambda (l)
    (make-set-aux l '())))

(define test-case
  (lambda (n)
    (cond
      ((zero? n) '())
      (else (cons (random 10) (test-case (sub1 n)))))))

(define test-case-1000000 (test-case 1000000))

(time (make-set test-case-1000000))
