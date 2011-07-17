class Comment < ActiveRecord::Base

  belongs_to :commentables, :polymorphic => true

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :author_name,  :presence => true,
                           :length   => { :maximum => 50 }
  validates :author_email, :presence => true,
                           :format   => { :with => email_regex }
  validates :content,      :presence => true

end
