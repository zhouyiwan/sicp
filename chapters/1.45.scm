(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (define (helper g t)
    (if (<= t 1)
        g
        (helper (lambda (x) (g (g x))) (- t 1))))
  (helper f n))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.000001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

; (display (sqrt 4)) ; 平方需要1次阻尼
; (newline)

(define (sqrt3 x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))

; (display (sqrt3 8)) ; 立方根需要1次阻尼
; (newline)

(define (sqrt4 x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y))))) 1.0))

; (display (sqrt4 16)) ; 4次方需要2次阻尼
; (newline)

(define (sqrt5 x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y))))) 1.0))

; (display (sqrt5 32)) ; 5次方需要2次阻尼
; (newline)

(define (sqrt6 x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y))))) 1.0))

; (display (sqrt6 64)) ; 6次方需要2次阻尼
; (newline)

(define (sqrt7 x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y y))))) 1.0))

; (display (sqrt7 128)) ; 7次方需要2次阻尼
; (newline)

(define (sqrt8 x)
  (fixed-point (average-damp (average-damp (average-damp (lambda (y) (/ x (* y y y y y y y)))))) 1.0))

; (display (sqrt8 256)) ; 8次方需要3次阻尼
; (newline)

(define (sqrt15 x)
  (fixed-point (average-damp (average-damp (average-damp (lambda (y) (/ x (* y y y y y y y y y y y y y y)))))) 1.0))

; (display (sqrt15 32768)) ; 15次方需要3次阻尼
; (newline)

(define (sqrt16 x)
  (fixed-point (average-damp (average-damp (average-damp (average-damp (lambda (y) (/ x (* y y y y y y y y y y y y y y y))))))) 1.0))

; (display (sqrt16 65536)) ; 16次方需要4次阻尼
; (newline)

; 总结，计算n次方根需要logn次阻尼
(define (mul x n)
  (if (<= n 0)
      1
      (* x (mul x (- n 1)))))

(define (calc x n)
  (define average-damp-n (log n))
  (fixed-point ((repeated average-damp average-damp-n) (lambda (y) (/ x (mul y (- n 1))))) 1.0))

(display (calc 32768 15)) ; 2.0000000071350366
(newline)
(display (calc 65536 16)) ; 2
(newline)
(display (calc 1048576 20)) ; 1.9999999414506457
(newline)
(display (calc 1099511627776 40)) ; 2.0000052645372124
(newline)