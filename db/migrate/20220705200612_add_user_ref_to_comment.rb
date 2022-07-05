class AddUserRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    rename_column :comments, :author_id
  end
end
