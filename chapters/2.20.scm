; 如果元素和第一个性质相同则保留，否则去除
(define (same-parity . w)
  (define (inner-same-parity a b)
    (cond
      ((null? b) '())
      ((eq? (remainder a 2) (remainder (car b) 2)) (cons (car b) (inner-same-parity a (cdr b))))
      (else (inner-same-parity a (cdr b)))))
  (inner-same-parity (car w) w))

(display (same-parity 1 2 3 4 5 6 7)); 1 3 5 7
(newline)
(display (same-parity 2 3 4 5 6 7)); 1 3 5 7
