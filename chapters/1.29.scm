(define (xps f a b n)
  (define h (/ (- b a) n))
  (define (sum f a next b)
    (if (> a b) 0
        (+ (f a) (sum f (next a) next b))))
  (define (even? x) (= (remainder x 2) 0))
  (define (next x) (+ 1 x))
  (define (fn k)
          (if (or (= 0 k) (= k n))
              (+ a (* k h))
              (* (if (even? k) 2 4) (+ a (* k h)))))
  (* (/ h 3.0)
     (sum fn 0 next n)))

(define (cube x) (* x x x))

(display (xps cube 0 1 100))
