class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_likes
  after_destroy :decrement_likes

  def increment_likes
    post.increment!(:likes_counter)
  end

  def decrement_likes
    post.decrement!(:likes_counter)
  end
end
