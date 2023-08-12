(define (cont-frac-iter n d k)
  (define (iter res i)
    (if (= 1 i)
      (/ (n i) (- (d i) res))
      (iter (/ (n i)
               (- (d i) res))
            (- i 1))))
  (iter 0.0 k))

(define (tan-cf x k)
  (cont-frac-iter (lambda (i) (if (= i 1) x) (square x)) (lambda (i) (- (* i 2) 1)) k))

(display (tan-cf 10 100))