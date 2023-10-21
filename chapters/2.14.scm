(define (make-interval a b) (cons a b))

(define (upper-bound x) (cdr x))

(define (lower-bound x) (car x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (define (inner-div-interval)
    (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
  (cond ((and (< (lower-bound y) 0)
              (>= (upper-bound y) 0))
         (display "报错"))
        (else (inner-div-interval))))

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

(define (percent i)
  (/ (- (upper-bound i) (center i)) (center i)))

;;;;;;;;;;;;;;;;;;;以下是题目;;;;;;;;;;;;;;;;;;;

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

;;;;;;;;;;; 请确认Lem是对的，两种算法会得到不同结果
(define r1 (make-center-percent 100 .1))
(define r2 (make-center-percent 100 .2))

(display (par1 r1 r2)) ; (31.304347826086957 . 77.6470588235294)
(newline)
(display (par2 r1 r2)) ; (42.35294117647059 . 57.391304347826086)
(newline)
;;;;;;;;;;; Lem确实是对的

;;;;;;;;;;; 用互通的算数表达式来检查这一行为
;;;;;;;;;;;没明白

;;;;;;;;;;;计算表达式A/A和A/B
(define A (make-center-percent 100 .5))
(define B (make-center-percent 100 .2))

(display (div-interval A A)) ;(.33333333333333337 . 3.)
(newline)
(display (div-interval B B)) ;(.6666666666666666 . 1.5)
(newline)

(define A1 (make-center-percent 100 .001))
(define B1 (make-center-percent 100 .0002))
(display (div-interval A1 A1)) ;(.9980019980019981 . 1.002002002002002)
(newline)
(display (div-interval B1 B1)) ;(.9996000799840034 . 1.0004000800160031)
(newline)
;;;;;;;;;;;百分比越小计算出来的误差越小