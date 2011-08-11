module ApplicationHelper
  def title
    'Typedef.me'
  end

  #def escape_codes(text)
    #text.scan(/<pre.+?>(.+?)<\/pre>/m).each do |match|
      #text.gsub!(match[0], h(match[0])) 
    #end
    #text
  #end

  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, 
               :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
