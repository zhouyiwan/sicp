(define (mul x n)
  (if (<= n 0)
      1
      (* x (mul x (- n 1)))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((null? a2) a1)
        ((null? a1) a2)
        ((product? a1) (if (=number? a2 0) a1 (list '+ a1 (make-sum 0 a2))))
        ((product? a2) (if (=number? a1 0) a2 (list '+ (make-sum 0 a1) a2)))
        ((sum? a1) (list '+ a1 (make-sum 0 a2)))
        ((sum? a2) (list '+ (make-sum 0 a1) a2))
        ((pair? a1) (make-sum (car a1) (make-sum (cdr a1) a2)))
        ((pair? a2) (make-sum (make-sum a1 (car a2)) (cdr a2)))
        ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((null? m2) m1)
        ((null? m1) m2)
        ((product? m1) (if (=number? m2 1) m1 (list '* m1 (make-product 1 m2))))
        ((product? m2) (if (=number? m1 1) m2 (list '* (make-product 1 m1) m2)))
        ((sum? m1) (list '* m1 (make-product 1 m2)))
        ((sum? m2) (list '* (make-product 1 m1) m2))
        ((pair? m1) (make-product (car m1) (make-product (cdr m1) m2)))
        ((pair? m2) (make-product (make-product m1 (car m2)) (cdr m2)))
        ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

; 被加数
(define (addend s) (cadr s))

; 加数
(define (augend s) (cddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

; 被乘数
(define (multiplier p) (cadr p))

; 乘数
(define (multiplicand p) (cddr p)); between the first letter ('c') and the last ('r'), a 'a' means "the car of" and a 'd' means "the cdr of".

(define (base exp) (cadr exp))

; (display (make-sum '(* x x (x x)) '(x)))
; (display (make-sum '(x x) 0))
; (display (make-product '(x x) 1))
; (newline)
; (display (make-product '(+ x (+ x x)) '(x)))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (if (null? (augend exp))
             (deriv (addend exp) var)
             (make-sum (deriv (addend exp) var)
                       (deriv (cons '+ (augend exp)) var))))
         ((product? exp)
            (if (null? (multiplicand exp))
                (deriv (multiplier exp) var)
                (make-sum
                  (make-product (multiplier exp)
                                (deriv (make-product (multiplicand exp) 1) var))
                  (make-product (make-product (multiplicand exp) 1)
                                (deriv (multiplier exp) var)))))
         (else (error "unknown expression type -- DERIVE" exp))))

(display (deriv '(* x x x x) 'x))
