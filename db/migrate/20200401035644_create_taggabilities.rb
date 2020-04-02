class CreateTaggabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :taggabilities do |t|
      t.belongs_to :post_category, null: false, foreign_key: true
      t.belongs_to :tag_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
