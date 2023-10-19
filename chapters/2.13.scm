; [a - a * p1, a + a * p1] * [b - b * p2, b + b * p2]
; [ab - ab * p2 - ab * p1 + ab * p1p2, ab + ab * p2 + ab * p1 + ab * p1p2]
; [ab(1 - (p1 + p2)) + ab * p1p2, ab(1 + (p1 + p2)) + ab * p1p2]
; 如果p1和P2都很小则可以忽略 ab * p1p2
; [ab(1 - (p1 + p2)), ab(1 + (p1 + p2))]
; 简化的公式以上
