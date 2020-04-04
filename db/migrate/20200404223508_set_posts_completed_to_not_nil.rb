class SetPostsCompletedToNotNil < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :completed, false
    change_column_default :posts, :completed, false
  end
end
