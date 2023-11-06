(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (d) (if (not (pair? d)) 1 (count-leaves d))) t)))

(display (count-leaves (list (list 1 2) (list 3 4))))