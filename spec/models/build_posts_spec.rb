require 'rails_helper'

RSpec.describe BuildPosts, type: :model do
  context 'posts' do
    it 'builds and searches posts' do
      user = create(:user, username: 'mikec', email: 'acentrelli@gmail.com', password: 'test')
      term = create(:term, keyword: 'gmk', category: 'buying_terms', user_id: user.id)
      #term = create(:term, keyword: 'origin', category: 'buying_terms', user_id: user.id)
      #term = create(:term, keyword: 'hyper', category: 'buying_terms', user_id: user.id)
      #post = create(:post, wanting_terms: "paypal", buying_terms: "GMK Hyperfuse Origins", url: "www.reddit.com", location: "NJ")
      post = create(:post, wanting_terms: "paypal", buying_terms: "GMK Taro", title: 'I have GMK Taro', url: "www.reddit.com", location: "NJ")
      #post = create(:post, wanting_terms: "paypal", buying_terms: "Planck Ez", url: "www.reddit.com", location: "NJ")
      model = BuildPosts.new.posts

    end
  end
end

