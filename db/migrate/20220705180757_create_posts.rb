class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :commments_counter
      t.integer :likes_counter
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
