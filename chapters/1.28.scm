(define (square-check x m)
  (if (and (not (= 1 x))
           (not (= x (- m 1)))
           (= (remainder (square x) m) 1))
      0
      (remainder (square x) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (square-check (expmod base (/ exp 2) m)
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(display (fast-prime? 561 561)) ; #f
(newline)
(display (fast-prime? 1105 1000)) ; #f
(newline)
(display (fast-prime? 1729 1000)) ; #f
(newline)
(display (fast-prime? 3 2)) ; #t
(newline)
(display (fast-prime? 7 5)) ; #t
(newline)
(display (fast-prime? 13 5)) ; #t