(define (cont-frac-iter n d k)
  (define (iter res i)
    (if (= 1 i)
      (/ (n i) (+ res (d i)))
      (iter (/ (n i)
               (+ (d i) res))
            (- i 1))))
  (iter 0.0 k))

(display (+ 2 
  (cont-frac-iter
    (lambda (i) 1)
    (lambda (i) (cond ((< i 2) 1)
                      ((= (remainder (- i 2) 3) 0) (* 2 (+ 1 (/ (- i 2) 3))))
                      (else 1)))
    1000
)))