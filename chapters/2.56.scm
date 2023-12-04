(define (mul x n)
  (if (<= n 0)
      1
      (* x (mul x (- n 1)))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))
; (display (=number? 1 1)) #t
; (display (=number? 'a 1)) #f

(define (variable? x) (symbol? x))
; (display (variable? 1)) ;#f
; (display (variable? 'a)) ;#t

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
; (display (same-variable? 'a 'a)); #t
; (display (same-variable? 'b 'a)); #f

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
; (display (make-sum 1 2)); 3
; (display (make-sum 0 2)); 2
; (display (make-sum 1 0)); 1
; (display (make-sum 1 'a)); (+ 1 a)

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
; (display (make-product 1 2)); 2
; (display (make-product 1 0)); 0
; (display (make-product 0 2)); 0
; (display (make-product 2 'a)); (* 2 a)

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
; (display (sum? '(+ 1 2))); #t
; (display (sum? '(* 1 2))); #f

; 被加数
(define (addend s) (cadr s))
; (display (addend '(+ 1 2))); 1

; 加数
(define (augend s) (caddr s))
; (display (augend '(+ 1 2))); 2

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
; (display (product? '(* 1 2))); #t
; (display (product? '(+ 1 2))); #f

; 被乘数
(define (multiplier p) (cadr p))
; (display (multiplier '(* 1 2))); 1

; 乘数
(define (multiplicand p) (caddr p))
; (display (multiplicand '(* 1 2))); 2

(define (make-exponentiation base exponent)
  (cond ((eq? exponent 0) 1)
        ((eq? exponent 1) base)
        ((and (number? base) (number? exponent)) (mul base exponent))
        (else (list '** base exponent))))
; (display (make-exponentiation 2 0)); 1
; (display (make-exponentiation 2 1)); 2
; (display (make-exponentiation 2 2)); 4
; (display (make-exponentiation 'a 2)); (** a 2)

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))
; (display (exponentiation? (make-exponentiation 'a 2))); #t

(define (exponent exp) (caddr exp))
; (display (exponent (make-exponentiation 'a 2))); 2

(define (base exp) (cadr exp))
; (display (base (make-exponentiation 'a 2))); 'a

(define (deriv exp var)
  (cond ((number? exp) 0)
         ((variable? exp)
          (if (same-variable? exp var) 1 0))
         ((sum? exp)
          (make-sum (deriv (addend exp) var)
                    (deriv (augend exp) var)))
         ((product? exp)
          (make-sum
            (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
            (make-product (multiplicand exp)
                          (deriv (multiplier exp) var))))
          ((exponentiation? exp)
            (make-product
              (* (exponent exp) (make-exponentiation (base exp) (- (exponent exp) 1)))
                 (deriv (base exp) var)))
          (else (error "unknown expression type -- DERIVE" exp))))
; (display (deriv '(+ x 3) 'x)); 1
; (display (deriv '(* x y) 'x)); y
; (display (deriv '(** 2 2) 'x)); 0