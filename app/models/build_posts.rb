class BuildPosts

  def posts
    response = RedditService.new.post
    if response
      response[:data][:children].each do |pos|
        require 'pry';binding.pry
        Post.new(wanting_terms: pos[:data][:title].split('[W]').last.strip,
                 buying_terms: pos[:data][:title].split('[W]').first.split('[H]').last.strip,
                 location: pos[:data][:title].split('[H]').first.strip,
                 url: pos[:data][:url])
      end
    end
  end
end
