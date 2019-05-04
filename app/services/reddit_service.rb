require "reddit/api"

class RedditService
  attr_reader :user

  def initialize
    @user = Reddit::Services::User.new ENV['REDDIT_USERNAME'], ENV['REDDIT_PASSWORD'], ENV['REDDIT_SCRIPT'], ENV['REDDIT_SECRET'], "web:mechtrackerv1.0(by/u/#{ENV['REDDIT_USERNAME']}"
  end

  def post
    Reddit::Services::Listings.get_new user, basepath_subreddit: "mechmarket", limit:20
  end
end
