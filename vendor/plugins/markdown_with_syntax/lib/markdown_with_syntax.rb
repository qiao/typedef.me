module MarkdownWithSyntax
  def markdown_with_syntax(text)
    syntax_highlight(markdown(text)).html_safe
  end

  def markdown(text)
    defaults = [:hard_wrap, :autolink, :no_intraemphasis, 
                :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *defaults).to_html
  end

  def syntax_highlight(text)
    doc = Nokogiri::HTML(text)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    (doc.to_s.scan /<body>(.+?)<\/body>/m)[0][0]
  end
end
