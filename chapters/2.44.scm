(define (up-split pinter n)
  (if (= n 0)
      pinter
      (let ((smaller (up-split pinter (- n 1))))
           (below (beside smaller smaller) pinter))))