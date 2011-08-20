atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @posts.each do |post|
    next if post.updated_at.blank?

    feed.entry(post) do |entry|
      entry.url post_url(post)
      entry.title post.title
      entry.content post.content, :type => 'html'
      entry.updated post.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")
    end
  end
end
