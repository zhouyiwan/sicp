; 怎么证明黄金分割率是变换x -> 1 + 1 / x的值呢？

(define (fixed-point f guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try guess))

(define (gold x)
  (+ 1 (/ 1 x)))

(display (fixed-point gold 1.0)) ; 1.6181818181818182