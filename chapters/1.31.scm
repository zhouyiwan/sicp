(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (identify x) x)

; 用product定义factorial
(define (factorial n)
  (product identify 1 (lambda (n) (+ n 1)) n))

; factorial的测试
(display (factorial 3)); 6
(newline)
(display (factorial 4)); 24
(newline)
(display (factorial 5)); 120
(newline)

(define (PI b)
  (define a 2.0)
  (define (next n) (+ n 2))
  (* 4
    (/ (* a
          b
          (square (product identify (+ a 2) next (- b 2))))
       (square (product identify (+ a 1) next b)))))

(display (PI 150))
(newline)

; 对除法之后的值进行平方降低数值计算的数量级
(define (PI-PLUS b)
  (define a 2.0)
  (define (next n) (+ n 2))
     (* 4 a b
        (square (/ (product identify (+ a 2) next (- b 2))
                   (product identify (+ a 1) next b)))))

(display (PI-PLUS 300))
(newline)

; 写出迭代计算的product
(define (product-iter term a next b)
  (define (iter res a)
    (if (> a b)
        res
        (iter (* res (term a)) (next a))))
  (iter 1 a))

(display (product-iter identify 2 (lambda (n) (+ 1 n)) 4)) ; 24