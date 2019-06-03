# frozen_string_literal: true

class RedditWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'high'

  def perform
    BuildPosts.new.posts
  end
end
