class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  before_save :format_url

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :author_name,  :presence => true,
                           :length   => { :maximum => 50 }
  validates :author_email, :presence => true
#                           :format   => { :with => email_regex }
  validates :content,      :presence => true

  private
  def format_url
    unless self.author_url.blank?
      self.author_url.strip!
      unless (self.author_url =~ /\w+:\/\//) == 0
        self.author_url = "http://#{self.author_url}" 
      end
    end
  end
end
