class RedditService

  def initialize
    @conn = Faraday.new(:url => 'https://www.reddit.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def post
    response = @conn.get do |req|
      req.url 'r/mechmarket/new.json'
      req.params['limit'] = 20
      req.headers['User-Agent'] = "web:mechtrackerv1.0(by/u/#{ENV['REDDIT_USERNAME']})"
    end
    parse(response.body)
  end

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
