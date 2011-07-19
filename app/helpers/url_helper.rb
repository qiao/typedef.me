module UrlHelper
  def post_url(post)
    post.created_at.strftime('/%Y/%m/%d/') + post.slug
  end

  def page_url(page)
    "/#{page.slug}"
  end

  def commentable_url(commentable)
    commentable.type == 'Post' ? post_url(commentable) : page_url(commentable)
  end
end
