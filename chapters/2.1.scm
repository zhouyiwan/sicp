(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom y)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom y)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))

(define (make-rat x y)
  (let ((g (gcd x y)))
       (cons (/ x g) (/ y g))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(display (add-rat (make-rat 1 2) (make-rat 1 2)))
(newline)
(display (div-rat (make-rat 1 2) (make-rat 1 2)))
(newline)
(display (mul-rat (make-rat 1 2) (make-rat 1 2)))
(newline)
(display (sub-rat (make-rat 1 2) (make-rat 1 2)))
(newline)
(display "测试完毕")
(newline)

; 有理数如果是正数分子分母都应该是正数，如果是负数那么应该只是分子是负数
(define (new-make-rat x y)
  (let ((g (gcd (abs x) (abs y)))
        (absx (abs x))
        (absy (abs y)))
       (cond ((and (<= x 0) (<= y 0)) (cons (/ absx g) (/ absy g)))
             ((and (>= x 0) (>= y 0)) (cons (/ x g) (/ y g)))
             ((< x 0) (cons (/ x g) (/ y g)))
             (else (cons (/ (- x) g) (/ absy g))))))

(display (new-make-rat 1 -2))
(newline)
(display (new-make-rat -1 -2))
(newline)
(display (new-make-rat 1 2))
(newline)
(display (new-make-rat 0 2))
