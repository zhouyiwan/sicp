; (define (cont-frac-iter n d k)
;   (define (iter res i)
;     (if (= 1 i)
;       (/ (n i) (- (d i) res))
;       (iter (/ (n i)
;                (- (d i) res))
;             (- i 1))))
;   (iter 0.0 k))

; (define (tan-cf x k)
;   (cont-frac-iter (lambda (i) (if (= i 1) x) (square x)) (lambda (i) (- (* i 2) 1)) k))

(define (tan-cf2 x k)
  (define (iter res k)
    (if (= 1 k)
        res
        (iter (/ (* x x)
                 (- (+ 1 (* 2 (- k 1))) res))
              (- k 1))))
  (* 1.0 (/ x (- 1 (iter 0 k)))))

(display (tan-cf2 10 100)) ; .6483608274590866