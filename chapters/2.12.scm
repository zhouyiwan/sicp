(define (make-interval a b) (cons a b))

(define (upper-bound x) (cdr x))

(define (lower-bound x) (car x))

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

(define (percent i)
  (/ (- (upper-bound i) (center i)) (center i)))

(display (make-center-percent 5 .2)) ; (4, 6)
(newline)

(display (percent (make-center-percent 5 .2))) ; .2