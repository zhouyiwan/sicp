(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ 1 x))

(display (((double (double double)) inc) 5)) ; 21