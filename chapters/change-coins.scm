; 将现金a换成除第一种硬币外其它硬币的组合方式数量加上
; 将现金a - b换成所有硬币兑换方式，b是第一种硬币
(define (count-change mount)
  (cc mount 5))

(define (cc mount n)
  (cond
    ((or (= n 0) (< mount 0)) 0)
    ((= 0 mount) 1)
    (else (+ (cc (- mount (first-denomination n)) n)
             (cc mount (- n 1))))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(display (count-change 100)); 292