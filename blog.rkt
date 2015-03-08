#lang web-server/insta
(define (start request)
  (response/xexpr
   '(html
     (head (title "My Blog"))
     (body (h1 "Under construction")
           (h2 "Now we're rockin")
           (p "I walk along the boulevard of Broken Dreams it's the only one I know")))))

; A blog is a (listof post)
; and a post is a (post title body)
(struct post (title body))

; BLOG: blog
; the static blog
(define BLOG 
  (list (post "Second Post!" "This is another post")
        (post "First Post" "This is my first post")))

; start: request -> response
; consumes a request, and produces a page that displays all of the web content.
(define (start request)
  (render-blog-page BLOG request))


; render-blog-page: blog request -> response
; consumes a blog and a request, and produces an HTML page
; of the content of the blog.
(define (render-blog-page a-blog request)
  (response/xexpr
   `(html (head (title "My Blog"))
          (body (h1 "My Blog")
                ,(render-posts a-blog)))))

; render-post: post -> xexpr
; consumes a post, produces an xexpr fragment of the post.
(define 


