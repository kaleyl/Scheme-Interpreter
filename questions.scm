(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  (if (null? first) rests
      (map (lambda (lst) (cons first lst)) rests)
  )
)

(define (zip pairs)
  (list (map car pairs) (map car (map cdr pairs)))
)

;; Problem 16
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 16
  (define (helper start lst n)
    (if (null? lst) start
      (helper (append start (list(cons n (list(car lst))))) (cdr lst) (+ n 1) )
    )
  )
  (helper nil s 0)
)
  ; END PROBLEM 16

;; Problem 17
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 17
  (cond ((null? denoms) nil)
        ((= total 0) (list nil))
        ((< total (car denoms)) (list-change total (cdr denoms)))
        (else (append (cons-all (car denoms) (list-change (- total (car denoms)) denoms)) (list-change total (cdr denoms))))
  ))
  ; END PROBLEM 17

;; Problem 18
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           'replace-this-line
           (append (list form params) (let-to-lambda body))
           ; END PROBLEM 18
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           'replace-this-line
          (append (list (append (list 'lambda (car (zip values))) (let-to-lambda body))) (map let-to-lambda (cadr (zip values))) )
           ; END PROBLEM 18
           ))
        (else
         ; BEGIN PROBLEM 18
         'replace-this-line
         (map let-to-lambda expr)
         ; END PROBLEM 18
         )
        ))

