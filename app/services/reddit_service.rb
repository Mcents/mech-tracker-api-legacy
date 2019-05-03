class RedditService
  include HTTParty
  base_uri 'http://www.reddit.com/r'

  def initialize
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post
    parse(self.class.get('/mechmarket/new.json?sort=new&limit=20'))
  end
end
