class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def like_counter
    likes.update(:likes_counter)
  end
end
