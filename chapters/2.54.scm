(define (equal? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((or (null? a) (null? b)) #f)
        ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        ((not (pair? a)) (if (not (eq? (length b) 1)) #f (equal? a (car b))))
        ((not (pair? b)) (if (not (eq? (length a) 1)) #f (equal? (car a) b)))
        (else (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))))

(display (equal? '(a ((b)) c) '(a b c))); true
(newline)

(display (equal? '(a ((b)) c) '(a b 1 c))); false
