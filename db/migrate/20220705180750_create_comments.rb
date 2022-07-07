class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true

      
      t.timestamps
    end

    add_reference :comments, :author, foreign_key: true
    add_reference :comments, :post, foreign_key: true
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
