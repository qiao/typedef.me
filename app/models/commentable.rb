class Commentable < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  before_save :update_content

  validates :title,       :presence => true
  validates :raw_content, :presence => true
  validates :slug,        :presence => true, 
                          :uniqueness => true
  
  default_scope :order => 'created_at DESC'

  scope :published, where(:published => true)
  scope :draft, where(:published => false)

  def published_at
    created_at.in_time_zone(8)
  end

  private
  def update_content
    self.content = markdown(self.raw_content) 
  end

  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, 
               :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(text)
    #pre_pattern = /<pre lang.+?\/pre>/m
    #separate_pattern = /<pre lang=\"(.+?)\">\W?<code>(.+?)<\/code>\W?<\/pre>/m

    #text.scan(pre_pattern).each do |pre_match|
      #pre_match.scan(separate_pattern).each do |match|
        #text.gsub!(pre_match, Albino.colorize(match[1], match[0]))
      #end
    #end
    #text

    doc = Nokogiri::HTML(text)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end

    (doc.to_s.scan /<body>(.+?)<\/body>/m)[0][0]
  end

end
