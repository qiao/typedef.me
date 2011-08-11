class Commentable < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  validates :title,   :presence => true
  validates :content, :presence => true
  validates :slug,    :presence => true, 
                      :uniqueness => true
  
  default_scope :order => 'created_at DESC'
  scope :published, where(:published => true)
  scope :draft, where(:published => false)

  def published_at
    created_at.in_time_zone(8)
  end
end
