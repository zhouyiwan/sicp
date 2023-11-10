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

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define (flat-map proc seq)
  (accumulate append nil (map proc seq)))

(define (pair-eq-num? pair num)
  (cond ((and (eq? 0 num) (null? pair)) #t) ; 这么判断其实是有问题，并不是num是0就一定是相等的，但是先这样
        ((null? pair) #f)
        (else (pair-eq-num? (cdr pair) (- num (car pair))))))

; 主要是生成全排列
; 一共三层循环找到全部满足条件的序对，然后过滤这些序对
(define (unique3 n s)
  (filter (lambda (a) (pair-eq-num? a s))
          (flat-map (lambda (a) (flat-map
                                  (lambda (b) (map (lambda (c) (list c b a)) (enumerate-interval 1 (- b 1))))
                                  (enumerate-interval 1 (- a 1))))
                    (enumerate-interval 1 n))))

(display (unique3 8 9))