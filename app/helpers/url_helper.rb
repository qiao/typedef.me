module UrlHelper
  def post_url(post)
    post.created_at.strftime('/%Y/%m/%d/') + post.slug
  end
end
