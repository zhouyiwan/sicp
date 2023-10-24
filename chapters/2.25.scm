(define items1 '(1 3 (5 7) 9))
(display (car (cdr (car (cdr (cdr items1))))))
(newline)

(define items2 '((7)))
(display (car (car items2)))
(newline)

(define items3 '(1 (2 (3 (4 (5 (6 7)))))))
(display 
  (car (cdr
    (car (cdr
      (car (cdr
        (car (cdr
          (car (cdr
            (car (cdr items3)))))))))))))
; '(1 (2)) 其中有三个序对(1 (2) 3), ((2) 3)和(2)
