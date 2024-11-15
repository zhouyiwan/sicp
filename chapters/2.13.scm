; [a - a * p1, a + a * p1] * [b - b * p2, b + b * p2]
; [ab - ab * p2 - ab * p1 + ab * p1p2, ab + ab * p2 + ab * p1 + ab * p1p2]
; [ab(1 - (p1 + p2)) + ab * p1p2, ab(1 + (p1 + p2)) + ab * p1p2]
; 如果p1和P2都很小则可以忽略 ab * p1p2
; [ab(1 - (p1 + p2)), ab(1 + (p1 + p2))]
; 简化的公式以上

(define (length? l)
  (if (null? l) 0
      (+ 1 (length (cdr l)))))

(define (last-pair l)
  (if (= 1 (length? l))
      l
      (last-pair (cdr l))))

; (display (last-pair (list 1 2 3 4)))

(define (reverse l)
  (define (inner-reverse il res)
    (if (null? il) res
        (inner-reverse (cdr il) (cons (car il) res))))
  (inner-reverse l '()))

(newline)

; (display (reverse (list 1 2 3 4)))

; (display (cons '(1 2) '(3 4)))

(newline)

; (display (cons (cons 1 2) (cons 3 4)))

(define (append a b)
  (if (null? a)
      b
      (cons (car a) (append (cdr a) b))))

(define (map fn list)
  (if (null? list) '()
      (cons (fn (car list)) (map fn (cdr list)))))

(newline)

(define (subsets s)
  (if (null? s)
      '(())
      (let ((rest (subsets (cdr s))))
           (append rest
                   (map (lambda (item) (cons (car s) item)) rest)))))

(display (subsets (list 1 2 3)))