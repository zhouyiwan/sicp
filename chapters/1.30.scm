(define (sum f a next b)
  (define (sum-iter total f a next b)
          (if (> a b) total
              (sum-iter (+ total (f a)) f (next a) next b)))
  (sum-iter 0 f a next b))

(display (sum (lambda (a) (* a a)) 1 (lambda (a) (+ a 1)) 2)) ; 5