(define (average a b)
  (/ (+ a b) 2))

(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (helper guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
            next
            (helper next))))
    (helper first-guess)))

(define (good-enough? a b)
  (< (abs (- a b)) 0.00001))

(define (sqrt x)
  (define (improve guess) (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(display (sqrt 9)) ; 3.
(newline)

(define (fixed-point f first-guess)
  ((iterative-improve good-enough? f) first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt-test x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(display (sqrt-test 4)) ; 2.000000000000002