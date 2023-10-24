(define (for-each f items)
  (define (next) (f (car items)) (for-each f (cdr items)))
  (if (null? items)
      #t
      (next)))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))