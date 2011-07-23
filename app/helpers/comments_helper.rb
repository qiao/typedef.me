module CommentsHelper
  def publish_time(comment)
    comment.created_at.in_time_zone(8).strftime("%Y-%m-%d %X")
  end

  def gravatar_for(comment)
    gravatar_image_tag(comment.author_email.downcase, 
                       :alt => comment.author_name,
                       :class => "gravatar_image",
                       :gravatar => { :default => :mm,
                                      :size => 32 })
  end
end
