#lang web-server/insta
(define (start request)
  (response/xexpr
   '(html
     (head (title "My Blog"))
     (body (h1 "Under construction")
           (h2 "Now we're rockin")
           (p "I walk along the boulevard of Broken Dreams it's the only one I know")))))