(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect vect1 vect2)
  (cons
    (+ (xcor-vect vect1) (xcor-vect vect2))
    (+ (ycor-vect vect1) (ycor-vect vect2))))

(define (sub-vect vect1 vect2)
  (cons
    (- (xcor-vect vect1) (xcor-vect vect2))
    (- (ycor-vect vect1) (ycor-vect vect2))))

(define (scale-vect scale vect)
  (cons
    (* (xcor-vect vect) scale)
    (* (ycor-vect vect) scale)))

(display (add-vect (make-vect 1 2) (make-vect 2 3))); (3 . 5)
(newline)

(display (sub-vect (make-vect 1 2) (make-vect 2 3))); (-1 . -1)
(newline)

(display (scale-vect 2 (make-vect 2 3))); (4 . 6)