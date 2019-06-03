# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    wanting_terms { 'MyString' }
    buying_terms { 'MyString' }
    url { 'MyString' }
    location { 'MyString' }
    title { 'MyString' }
  end
end
