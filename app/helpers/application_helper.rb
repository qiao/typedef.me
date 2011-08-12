module ApplicationHelper
  def title
    'Typedef.me'
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

  def logged_in?
    session[:logged_in]
  end
end
