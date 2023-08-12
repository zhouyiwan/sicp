(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.000001))
  
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (f x)
  (/ (log 1000)
     (log x)))

(define (f-avarage x)
  (/
    (+ x (/ (log 1000) (log x)))
    2))

(display (fixed-point f 10.0)) ; 40行

(newline)

(display (fixed-point f-avarage 10.0)) ; 12行
