; 这个习题主要考察对cons的理解，cons的作用是将两个元素粘合成一对，无论两个元素的类型是什么。仅此而已。
; 然后通过car和cdr将粘合的元素取出来

; (define (make-frame origin edge1 edge2)
;   (list origin edge1 edge2))

; (define (frame-origin frame)
;   (car frame))

; (define (frame-edge1 frame)
;   (cadr frame))

; (define (frame-edge2 frame)
;   (cadr (cdr frame)))

; ;;;;;;;;;;;;;;;;
; (define (make-frame origin edge1 edge2)
;   (cons origin (cons edge1 edge2)))

; (define (frame-origin frame)
;   (car frame))

; (define (frame-edge1 frame)
;   (cadr frame))

; (define (frame-edge2 frame)
;   (cdr (cdr frame)))

(newline)
(display 'a)
(newline)
(display "a")
(newline)
(display (eq? 'a 'a))
(newline)
(display (eq? "a" "a"))