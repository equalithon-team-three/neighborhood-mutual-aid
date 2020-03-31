class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :request_offer
      t.string :details
      t.datetime :date_posted
      t.string :location
      t.string :quantity
      t.datetime :deadline
      t.boolean :completed

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
