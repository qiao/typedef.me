class Commentable < ActiveRecord::Base
  include MarkdownWithSyntax

  has_many :comments, :dependent => :destroy

  before_save :update_content

  validates :title,       :presence => true
  validates :raw_content, :presence => true
  validates :slug,        :presence => true, 
                          :uniqueness => true
  
  default_scope :order => 'created_at DESC'

  scope :published, where(:published => true)
  scope :draft, where(:published => false)

  private
  def update_content
    self.content = markdown_with_syntax(self.raw_content) 
  end
end
