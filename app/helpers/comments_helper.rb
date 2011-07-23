module CommentsHelper
  def publish_time(comment)
    comment.created_at.in_time_zone(8).strftime("%Y-%m-%d %X")
  end
end
