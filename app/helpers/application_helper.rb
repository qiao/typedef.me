module ApplicationHelper
  def title
    'Typedef.me'
  end

  def post_url(post)
    post.created_at.strftime('%Y/%m/%d/') + post.slug
  end
end
