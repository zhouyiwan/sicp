(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m)))) ; 这里本来少计算的一半又被计算了一遍，所以logn变成了n
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))