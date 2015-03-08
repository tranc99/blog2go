#lang web-server/insta


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
(define (render-post a-post)
  `(div ((class "post"))
        ,(post-title a-post)
        (p , (post-body a-post))))

; render-posts: blog -> xexpr
; consumes a blog, produces an xexpr fragment of all its posts
(define (render-posts a-blog)
  `(div ((class "posts"))
        ,@(map render-post a-blog)))




