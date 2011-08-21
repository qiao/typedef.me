module CommentsHelper
  def gravatar_for(comment)
    gravatar_image_tag(comment.author_email.downcase, 
                       :alt => comment.author_name,
                       :class => "gravatar_image",
                       :gravatar => { :default => :mm,
                                      :size => 32 })
  end
end
