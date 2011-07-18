class Commentable < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  validates :title,   :presence => true
  validates :content, :presence => true
  validates :slug,    :presence => true, 
                      :uniqueness => true
  
  scope :published, where(:published => true)
  scope :draft, where(:published => false)
end
