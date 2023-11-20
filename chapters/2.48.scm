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

;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-segment segment1 segment2)
  (cons segment1 segment2))

(define start-segment car)

(define end-segment cdr)
