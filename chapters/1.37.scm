; 递归过程
(define (cont-frac n d k)
  (define (inner-cont-frac i)
    (if (= k i)
      (/ (n i) (d i))
      (/ (n i)
         (+ (d i)
            (inner-cont-frac (+ i 1))))))
  (inner-cont-frac 1))

(display (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1000))

(newline)

; 迭代计算过程，迭代计算除了可以从小到大，也可以从大到小
(define (cont-frac-iter n d k)
  (define (iter res i)
    (if (= 1 i)
      (/ (n i) (+ res (d i)))
      (iter (/ (n i)
               (+ (d i) res))
            (- i 1))))
  (iter 0.0 k))

(display (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 1000))