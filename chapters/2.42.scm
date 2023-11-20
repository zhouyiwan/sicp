(define nil '())
; 如果知道了k - 1的所哟排法，那么就需要针对这些排法
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define (flat-map proc seq)
  (accumulate append nil (map proc seq)))

(define empty-board nil)

(define (same-row? pos1 pos2)
  (eq? (car pos1) (car pos2)))

(define (same-col? pos1 pos2)
  (eq? (cadr pos1) (cadr pos2)))

(define (same-x? pos1 pos2 dis)
  (let ((disx (abs (- (car pos1) (car pos2))))
        (disy (abs (- (cadr pos1) (cadr pos2)))))
        (and (eq? disx dis) (eq? disy dis))))

(define (safe? outerk positions)
  (define (inner-safe? k positions target)
    (if (null? positions)
        #t
        (let ((curPosition (car positions)))
             (cond ((or (same-row? curPosition target) (same-col? curPosition target) (same-x? curPosition target (- outerk k))) #f)
                   (else (inner-safe? (- k 1) (cdr positions) target))))))
  (inner-safe? (- outerk 1) (cdr positions) (car positions)))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

; 首先定义棋子摆放在棋盘上的格式(((1 2) (2 1)))这是一种
; 当k-1个列都准备好了，针对这k-1列排列的每种可能，加上(1, k), (2, k), (3, k), ...个可能
; 过滤这些可能留下所有满足条件的作为下一次的入参
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flat-map
            (lambda (rest-of-queens)
              (map (lambda (new-row) (cons (list new-row k) rest-of-queens))
                    (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(display (length (queens 8))); 92