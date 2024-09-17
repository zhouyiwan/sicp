(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ".")
  (display (y-point p))
  (display ")"))

(print-point (make-point 1 2)) ; "(1.2)"

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment p)
  (car p))

(define (end-segment p)
  (cdr p))

(define (midpoint-segment seg)
  (make-point (/ (+ (x-point (start-segment seg))
                    (x-point (end-segment seg)))
                 2)
              (/ (+ (y-point (start-segment seg))
                    (y-point (end-segment seg)))
                 2)))
(newline)
(display (midpoint-segment (make-segment (make-point 0 0) (make-point 2 2)))); (1.1)