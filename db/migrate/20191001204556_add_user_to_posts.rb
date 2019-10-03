class AddUserToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user_id, :integer, foreign_key: true
    change_column_null :posts, :user_id, false
  end
end
