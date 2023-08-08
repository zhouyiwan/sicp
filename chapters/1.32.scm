; 递归版本
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (identify x) x)

(define (sum a b)
  (accumulate + 0 identify a (lambda (x) (+ x 1)) b))

(display (sum 1 5)); 15
(newline)

(define (product a b)
  (accumulate * 1 identify a (lambda (x) (+ x 1)) b))

(display (product 1 6)) ; 720
(newline)

(define (sum a b)
  (accumulate + 0 identify a (lambda (x) (+ x 1)) b))

; 不用显式透传参数的版本
(define (accumulate-plus combiner null-value term a next b)
  (define (accumulate-inner a b)
    (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-inner (next a) b))))
  (accumulate-inner a b))

; 迭代版本
(define (accumulate-iter combiner null-value term a next b)
  (define (iter res a)
    (if (> a b)
        res
        (iter (combiner res (term a)) (next a))))
  (iter null-value a))

(define (sum-iter a b)
  (accumulate + 0 identify a (lambda (x) (+ x 1)) b))

(display (sum-iter 1 5)); 15
(newline)

(define (product-iter a b)
  (accumulate-iter * 1 identify a (lambda (x) (+ x 1)) b))

(display (product-iter 1 6)) ; 720
(newline)