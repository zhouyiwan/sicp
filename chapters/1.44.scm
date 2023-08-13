(define (repeated f n)
  (define (helper g t)
    (if (= t 1)
        g
        (helper (lambda (x) (g (g x))) (- t 1))))
  (helper f n))

(define dx 0.00001)

(define (smooth f x)
  (/ (+ (f (- x dx)) (f x) (f (+ x dx)))
     3))

(define (smooth-n f n)
  (repeated (lambda (x) (smooth f x)) n))
