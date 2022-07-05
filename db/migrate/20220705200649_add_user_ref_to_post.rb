class AddUserRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    rename_column :posts, :author_id
  end
end
