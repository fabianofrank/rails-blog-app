class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def comment_counter
    comments.update(:comments_counter)
  end
end
