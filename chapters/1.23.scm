(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2) 3 (+ 2 n)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(display (smallest-divisor 199)) ; 199
(newline)
(display (smallest-divisor 1999)) ; 1999
(newline)
(display (smallest-divisor 19999)) ; 7
