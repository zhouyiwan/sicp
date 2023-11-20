(define nil '())

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subset (cdr s))))
        (append rest (map (lambda (item) (cons (car s) item)) rest)))))

(display (subsets (list 1 2 3)))