(define x (list 1 2 3))
(define y (list 4 5 6))

(display (append x y)); (1, 2, 3, 4, 5, 6)
(newline)

(display (cons x y)); ((1, 2, 3), 4, 5, 6)
(newline)

(display (list x y)); ((1, 2, 3), (4, 5, 6))

; (list 1) 表示 (const 1 nil)
; 在控制台中序对的两个元素都不是序对的话中间会展示 . ，如果第二个元素也是序对的话则不会