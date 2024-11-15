(define (split a b)
  (lambda (painter n)
    (if (= n 0)
      painter
      (let ((smaller ((split a b) painter (- n 1))))
        (a painter (b smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))


(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect v1 v2)
  (cons (+ (car v1) (car v2)) (+ (cdr v1) (cdr v2))))

(define (sub-vect v1 v2)
  (cons (- (car v1) (car v2)) (- (cdr v1) (cdr v2))))

(define (scale-vect s v)
  (cons (* s (car v)) (* s (cdr v))))