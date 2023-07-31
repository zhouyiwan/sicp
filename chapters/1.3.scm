(define (max-sum a b c)
  (+ (if (or (> a b) (> a c)) a 0)
     (if (or (> b a) (> b c)) b 0)
     (if (or (> c a) (> c b)) c 0)))

(display (max-sum 1 2 3)) ; 5
(newline)
(display (max-sum 10 2 3)) ; 13