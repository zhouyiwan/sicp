(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n) ; 当m是n的因子，那么n/m也是n的因子，又因为m*(n/m)不可能大于n所以m和n/m中总有一个小于根号n，所以如果test-divisor的平方大于n那么说明n是素数
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(display (smallest-divisor 199)) ; 199
(newline)
(display (smallest-divisor 1999)) ; 1999
(newline)
(display (smallest-divisor 19999)) ; 7
