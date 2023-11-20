(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
          (make-frame new-origin
                      (sub-vect (m corner1) new-origin)
                      (sub-vect (m corner2) new-origin)))))))

(define (below1 painter1 painter2)
  (let ((paint-top
          (transform-painter painter1
                             (make-vect 0 0)
                             (make-vect 1 0)
                             (make-vect 0 0.5)))
        (paint-bottom
          (transform-painter painter2
                             (make-vect 0 0.5)
                             (make-vect 1 0.5)
                             (make-vect 0 1))))
        (lambda (frame)
          (paint-top frame)
          (paint-bottom frame))))

(define (flip-270 painter)
  (transform-painter painter (make-vect 0 1) (make-vect 0 0) (make-vect 1 1)))

(define (below2 painter1 painter2)
  (let ((paint-top
          (transform-painter painter1
                             (make-vect 0 0)
                             (make-vect 1 0)
                             (make-vect 0 0.5)))
        (paint-bottom (flip-270 paint-top)))
        (lambda (frame)
          (paint-top frame)
          (paint-bottom frame))))