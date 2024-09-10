(define (halve n) (/ n 2))

(define (double n) (+ n n))

(define (* a b)
  (define (iter aa b a)
    (cond ((= b 0) aa)
          ((= 0 (halve b)) (iter (double aa) (halve b) a))
          (else (iter (+ aa a) (- b 1) a))))
  (iter 0 b a))

(display (* 2 0))