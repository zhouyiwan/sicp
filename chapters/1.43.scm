(define (inc x) (+ x 1))

; 非compose版本
(define (repeated f n)
  (define (helper g t)
    (if (= t 1)
        g
        (helper (lambda (x) (g (g x))) (- t 1))))
  (helper f n))

(display ((repeated inc 2) 10)) ; 12
(newline)

; compose版本
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated-compose f n)
  (define (helper g t)
    (if (= t 1)
        g
        (helper (compose g f) (- t 1))))
  (helper f n))

(display ((repeated-compose inc 2) 10)) ; 12
