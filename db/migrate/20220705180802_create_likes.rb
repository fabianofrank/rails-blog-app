class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :author_id
      t.bigint :post_id

      t.timestamps
    end

    add_foreign_key :likes, :users, column: :author_id
    add_foreign_key :likes, :posts, column: :post_id

    add_reference :likes, :author_id, foreign_key: true
    add_reference :likes, :post_id, foreign_key: true
  end
end
