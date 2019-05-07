class BuildPosts

  def posts
    response = RedditService.new.post
    response[:data][:children].each do |pos|
      Post.create(wanting_terms: pos[:data][:title].split('[W]').last.strip,
                  buying_terms: pos[:data][:title].split('[W]').first.split('[H]').last.strip,
                  location: pos[:data][:title].split('[H]').first.strip,
                  url: pos[:data][:url])
    end
    search_posts
  end

  def search_posts
    Term.all.each do |term|
      matches = Post.where("lower(#{term.category}) like ?", "%#{term.keyword.downcase}%")
    end
  end
end
