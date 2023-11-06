(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest) 
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

(display (fold-right / 1 (list 1 2 3)))
(newline)

(display (fold-left / 1 (list 1 2 3)))
(newline)

(display (fold-right list nil (list 1 2 3)))
(newline)

(display (fold-left list nil (list 1 2 3)))

; 操作符应该和操作数的顺序无关即可