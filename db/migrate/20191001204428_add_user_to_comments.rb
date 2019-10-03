class AddUserToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :integer, foreign_key: true
    change_column_null :comments, :user_id, false
  end
end
