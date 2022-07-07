class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def count_comment
  end

  def count_like
  end

  def recent_comments
  end
end
