(define (repeated x n)
  (define (helper g t)
    (if (= t 1)
        g
        (helper (* g x) (- t 1))))
  (helper x n))

(define (count-0-remainder-divisions n divisor)
   (define (iter try-exp)
     (if (= 0 (remainder n (repeated divisor try-exp)))
         (iter (+ try-exp 1))  ;; Try another division. 
         (- try-exp 1)))
   ;; We don't need to try 0 divisions, as that will obviously pass. 
   (iter 1))

(define (cons a b)
  (*
    (repeated 2 a)
    (repeated 3 b)))

(define (car x)
  (count-0-remainder-divisions x 2))

(define (cdr x)
  (count-0-remainder-divisions x 3))

(define a (cons 2 3))

; (display a)

(display (car a)) ; 2
(display (cdr a)) ; 3
