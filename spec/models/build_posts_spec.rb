require 'rails_helper'

RSpec.describe BuildPosts, type: :model do
  context 'posts' do
    model = BuildPosts.new.posts
  end
end

