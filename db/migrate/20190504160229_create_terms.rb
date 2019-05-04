class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.string :keyword
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
