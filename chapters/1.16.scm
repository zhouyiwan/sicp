(define (square n) (* n n))

(define (even? n) (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter b bb n)
    ; 如果是0因为默认值是1所以结果也是对的
    (cond ((= n 0) bb)
          ((even? n) (fast-expt-iter b (square bb) (/ n 2)))
          (else (fast-expt-iter b (* b bb) (- n 1)))))
  (fast-expt-iter b 1 n))

(display (fast-expt 2 3))