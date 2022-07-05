class AddPostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
    rename_column :likes, :post_id
  end
end
