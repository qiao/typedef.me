module TitleHelper
  def title
    if @title.nil?
      APP_CONFIG['base_title']
    else
      "#{@title} | #{APP_CONFIG['base_title']}"
    end
  end
end
