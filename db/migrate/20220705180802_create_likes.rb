class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true

      t.timestamps
    end

    add_reference :likes, :author, foreign_key: true
    add_reference :likes, :post, foreign_key: true
    add_foreign_key :likes, :users, column: :author_id
    add_foreign_key :likes, :posts, column: :post_id
  end
end
