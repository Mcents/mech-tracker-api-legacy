# frozen_string_literal: true

FactoryBot.define do
  factory :term do
    keyword { 'Origin' }
    category { 'buying_terms' }
    user { nil }
  end
end
