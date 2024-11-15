(define (displayln x)
  (display x)
  (newline))

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (d) (if (not (pair? d)) 1 (count-leaves d))) t)))

; (display (count-leaves (list (list 1 2) (list 3 4))))

(define (enumerate-interval low high)
  (if (> low high) '()
      (cons low (enumerate-interval (+ 1 low) high))))

; (display (enumerate-interval 1 10))
; (newline)

(define (map proc v)
  (if (null? v) '()
    (cons (proc (car v)) (map proc (cdr v)))))

; (display (map (lambda (v) (+ v 1)) (list 1 2 3 4)))
; (newline)

(define (append a b)
  (if (null? a) b
      (cons (car a) (append (cdr a) b))))

(define (flat-map proc v)
  (accumulate append '() (map proc v)))

; (display (flat-map (lambda (x) (list 1 2 3 3)) (list 1 2 3)))
; (newline)

(define (unique-pairs n)
  (flat-map (lambda (i) (map (lambda (j) (list j i))
                             (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 n)))

; (displayln (unique-pairs 3))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (filter prime-sum?
          (unique-pairs n)))

(define (queens board-size)
  (define (safe? k positions)
    ; (displayln k)
    ; (displayln positions)
    ; #t
    (define (two-pos-in-x? a b)
      (= (abs (- (cadr a) (cadr b)))
         (abs (- (car a) (car b)))))
    (define curPos (car positions))
    (define (inner innerk positions)
      ; (define col (car positions))
      (cond ((= 0 innerk) #t)
            ((or (= (cadr curPos) (cadr (car positions))) (two-pos-in-x? curPos (car positions))) #f)
            (else (inner (- innerk 1) (cdr positions)))))
    (inner (- k 1) (cdr positions)))
  (define (adjoin-position new-row k rest-of-queens)
    (cons (list k new-row) rest-of-queens))
  (define empty-board nil)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flat-map
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                      (adjoin-position new-row k rest-of-queens))
                      (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
    (queen-cols board-size))

(display (length (queens 8)))

; (define (safe? k positions)
;     ; (displayln k)
;     (displayln positions)
;     ; #t
;     (define (two-pos-in-x? a b)
;       (= (abs (- (cadr a) (cadr b)))
;          (abs (- (car a) (car b)))))
;     (define curPos (car positions))
;     (define (inner innerk positions)
;       ; (define col (car positions))
;       (cond ((= 0 innerk) #t)
;             ((or (= (cadr curPos) (cadr (car positions))) (two-pos-in-x? curPos (car positions))) #f)
;             (else (inner (- innerk 1) (cdr positions)))))
;     (inner (- k 1) (cdr positions))
;     )

; (display (safe? 3 '((3 2) (2 3) (1 1))))