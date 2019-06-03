# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :wanting_terms
      t.string :title
      t.string :buying_terms
      t.string :url
      t.string :location

      t.timestamps
    end
  end
end
