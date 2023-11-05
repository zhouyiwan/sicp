(define nil '())

(define (subset s)
  (if (null? s)
      (list nil)
      (let ((rest (subset (cdr s))))
        (append rest (map (lambda (item) (cons (car s) item)) rest)))))

(display (subset (list 1 2 3)))