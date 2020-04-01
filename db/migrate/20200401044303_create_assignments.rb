class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :assignment_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
