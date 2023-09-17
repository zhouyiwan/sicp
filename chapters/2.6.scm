(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (inc a)
  (+ a 1))

; 在这里作者将数抽象成函数

; 将zero带入add-1得出
; step1用zero替换add-1中的n
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))

; step2继续规约用f作为n的入参调用n
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))

; step3继续规约使用x作为参数调用匿名函数
(lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

; 将one带入add-1得出
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))

(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))

(lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; (display (((add-1 (add-1 (add-1 zero))) inc) 0))

; 所以在这个体系里f作用于x几次就代表了数字几

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

(display (((add one two) inc) 0))

; (display (((add-1 (add-1 (add-1 zero))) inc) 0))

; 数不一定要从0开始，可以从一个指定的数开始，递增的运算也可以被抽象为，递增的动作，
; 而这个动作不一定是加1，只是在正整数或者日常生活中大部分情况是递增1
; 所以在抽象中递增被抽象为一次过程的应用，这个过程可以是+1