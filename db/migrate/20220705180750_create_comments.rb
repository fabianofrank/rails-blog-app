class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :author_id
      t.bigint :post_id
      
      t.string :text
      
      t.timestamps
    end

    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id

    add_reference :comments, :author_id, foreign_key: true
    add_reference :comments, :post_id, foreign_key: true
  end
end
