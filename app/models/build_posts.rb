# frozen_string_literal: true

require './app/mailers/user_mailer.rb'

class BuildPosts
  def posts
    response = RedditService.new.post
    response[:data][:children].each do |pos|
      Post.create(wanting_terms: pos[:data][:title].split('[W]').last.strip,
                  buying_terms: pos[:data][:title].split('[W]').first.split('[H]').last.strip,
                  title: pos[:data][:title].strip,
                  location: pos[:data][:title].split('[H]').first.strip,
                  url: pos[:data][:url])
    end
    Post.limit(20).destroy_all if Post.count > 20
    search_posts
  end

  def search_posts
    Term.all.each do |term|
      matches = Post.where("lower(#{term.category}) like ?", "%#{term.keyword.downcase}%")
      UserMailer.with(user: term.user, matches: matches, term: term).match_email.deliver if matches.count >= 1
    end
  end
end
