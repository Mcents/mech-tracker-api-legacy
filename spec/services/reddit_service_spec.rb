# frozen_string_literal: true

require 'rails_helper'

describe RedditService
context 'it retrieves latest reddit posts' do
  it '.post' do
    posts = RedditService.new.post

    expect(posts.class).to eq(Hash)
  end
end
