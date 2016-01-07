(define (date-list ls)
    (cond ((null? ls) '())
    (else (cons (cadar ls) (date-list (cdr ls))))))
    
(define (valid-date ls)
    (cond ((null? ls) #t)
    ((not (and (>= (cadar ls) 1) (<= (cadar ls) 12))) #f)
    (else (and (>= (cadar ls) 1) (<= (cadar ls) 12))
                (if ((date-check (caar ls) (cadar ls)))
                    (valid-date (cdr ls))
                    #f))))
                    
(define (date-check n p)
    (cond ((and (= 2 p) (and (>= n 1) (<=n 28))) #t)
        ((and (even? p) (and (>= n 1) (<= n 30))) #t)
        ((and (odd? p) (and (>= n 1) (<= n 31))) #t)
        (else #f)))
        
(define (date-compare lst1 lst2)
    (cond ((or (null? lst1) (null? lst2)) '())
        ((if (= (caddar lst2) (car (cddadr lst2)))
                (if (= (cadar lst2) (cadadr lst2))
                        (if (= (caar lst2) (caadr lst2))
                                (cons (caar lst1) (caadr lst1))
                                (date-compare lst1 (cdr lst2)))
                        (date-compare lst1 (cdr lst2)))
                (date-compare lst1 (cdr lst2))))))
        
(define (main ls)
    (define lst1 (date-list ls))
    (define (print ls lst1)
        (cond ((null? ls) '())
        ((valid-date lst1)  (cons (date-compare ls (cdr lst1)) (print (cdr ls) (cdr lst1))))
        (else "Invalid dates"))))                
