; 背景：两个区间相乘的只能是区间1的端点乘以区间2的端点，不能区间1的端点乘以区间1的端点构成左端点或者右端点
; 题目中的不超过两次，说的是计算上边界和下边界，正好两次
; 每个区间根据是否跨过0可以分成三种，区间在0左边，在0右边和跨过0
; 一共有两个区间，所以乘起来一共有9种
; 通过这9中的区分是可以算出来最大和最小的乘法，所以无需额外的乘法
; 即可计算出来最大最小值

(define (mul-interval x y)
  (let ((xl (lower-bound x))
        (xh (upper-bound x))
        (yl (lower-bound y))
        (yh (upper-bound y)))
        (cond
          ((and (> xl 0) (> yl 0)) (make-interval ((* xl yl) (* xh yh))))
          ((and (< xh 0) (< yh 0)) (make-interval ((* xh yh) (* xl yl))))
          ((and (< xh 0) (> yl 0)) (make-interval ((* xl yh) (* xh yl))))
          ((and (> xl 0) (< yh 0)) (make-interval ((* xh yl) (* xl yh))))
          ((and (< xh 0) (and (< yl 0) (> yh 0))) (make-interval ((* xl yh) (* xl yl))))
          ((and (> xl 0) (and (< yl 0) (> yh 0))) (make-interval ((* xh yl) (* xh yh))))
          ((and (and (< xl 0) (> xh 0)) (< yh 0)) (make-interval ((* xh yl) (* xl yl))))
          ((and (and (< xl 0) (> xh 0)) (> yl 0)) (make-interval ((* xl yh) (* xh yh))))
          (else (make-interval ((* (min xl yl) (max xh yh))
                                (max (* xl yl) (* xh yh)))))))) ; 这里就调用了三次，所以这个答案是错的