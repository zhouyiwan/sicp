(define (average a b)
  (/ (+ a b) 2))

(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (helper guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
            next
            (helper next))))
    (helper first-guess)))

(define (good-enough? a b)
  (< (abs (- a b)) 0.00001))

(define (sqrt x)
  (define (improve guess) (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))
; 以上是牛顿发开平方实现

(define (square x) (* x x))

; 用四个点表示矩形
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (two-points-dis p1 p2)
  (sqrt (+ (square (abs (- (x-point p2) (x-point p1))))
           (square (abs (- (y-point p2) (y-point p1)))))))

(define (make-rect p1 p2 p3 p4)
  (cons (cons p1 p2) (cons p3 p4)))

(define (width rect)
  (let ((lt-point (car (car rect)))
        (rt-point (cdr (car rect))))
       (two-points-dis rt-point lt-point)))

(define (height rect)
  (let ((lt-point (car (car rect)))
        (lb-point (cdr (cdr rect))))
       (two-points-dis lt-point lb-point)))

; 周长
(define (girth rect)
  (* 2 (+ (width rect) (height rect))))

; 面积
(define (area rect)
  (* (width rect) (height rect)))

(define rect (make-rect (make-point 0 1)
                        (make-point 1 1)
                        (make-point 1 0)
                        (make-point 0 0)))

(display (girth rect)) ; 4

(display (area rect)) ; 1
