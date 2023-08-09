(define (filtered-accumulate combiner null-value term a next b filtered)
  (if (> a b)
    null-value
    (combiner
      (if (filtered a) (term a) null-value)
      (filtered-accumulate combiner null-value term (next a) next b filtered))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (identify n) n)

(display (filtered-accumulate + 0 identify 1 (lambda (n) (+ 1 n)) 5 prime?)) ; 11
(newline)

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define n 5)
(display (filtered-accumulate * 1 identify 1 (lambda (n) (+ 1 n)) n (lambda (x) (= (gcd x n) 1)))); 24