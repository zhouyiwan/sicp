(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else 
          (+ (cc amount (except-first-denomination coin-values))
             (cc (- amount (first-denomination coin-values))
                 coin-values)))))

(define no-more? null?)

(define first-denomination car)

(define except-first-denomination cdr)

(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(display (cc 100 us-coins)); 292
(newline)
(display (cc 20 uk-coins)); 293

; 顺序不会影响求值，为什么？？？？