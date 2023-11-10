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

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence)) (cons (car sequence) (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

;;;;;;;;;;; 从之前章节里贴过来的

; (display (accumulate
;             append
;             nil
;             (map (lambda (n)
;                     (map (lambda (m) (list m n)) 
;                       (enumerate-interval 1 (- n 1))))
;               (enumerate-interval 1 10))))

(define (flat-map proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum?
      (flat-map (lambda (n)
                  (map (lambda (m) (list m n))
                        (enumerate-interval 1 (- n 1))))
                (enumerate-interval 1 10)))))

(define (remove item sequence)
  (filter (lambda (x) (not (= item x))) sequence))

(define (permutations s)
  (if (null? s)
      (list nil)
      (flat-map (lambda (n)
                  (map (lambda (a) (cons n a))
                      (permutations (remove n s))))
                s)))

; (display (permutations (list 1 2 3)))

(define (unique-pairs n)
  (flat-map (lambda (x) (map
                          (lambda (y) (list x y)) 
                          (enumerate-interval 1 (- n 1))))
            (enumerate-interval 1 n)))

(define (prime-sum-pairs2 n)
  (map make-pair-sum
    (filter prime-sum?
      (unique-pairs n))))

(display (prime-sum-pairs2 10)); ((1 1 2) (1 2 3) (1 4 5) (1 6 7) (2 1 3) (2 3 5) (2 5 7) (2 9 11) (3 2 5) (3 4 7) (3 8 11) (4 1 5) (4 3 7) (4 7 11) (4 9 13) (5 2 7) (5 6 11) (5 8 13) (6 1 7) (6 5 11) (6 7 13) (7 4 11) (7 6 13) (8 3 11) (8 5 13) (8 9 17) (9 2 11) (9 4 13) (9 8 17) (10 1 11) (10 3 13) (10 7 17) (10 9 19))