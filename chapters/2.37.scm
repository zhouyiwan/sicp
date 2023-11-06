(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (accumulate + 0 (map * x v))) m))

(define test-data (list (list 1 2 3 4) (list 4 5 6 6)))

(display (matrix-*-vector (list (list 1 2 3 4) (list 4 5 6 6)) (list 1 2 3 4))); (30 56)
(newline)

(define (transpose mat)
  (accumulate-n cons nil mat))

(display (transpose test-data))
(newline)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (im) (map (lambda (ic) (dot-product im ic)) cols)) m)))

(display (matrix-*-matrix test-data test-data))