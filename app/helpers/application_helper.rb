module ApplicationHelper
  def title
    'Typedef.me'
  end

  def escape_codes(text)
    text.scan(/<pre.+?>(.+?)<\/pre>/m).each do |match|
      text.gsub!(match[0], h(match[0])) 
    end
    text
  end
end
