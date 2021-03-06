class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attribute :posts_counter, :integer, default: 0

  validates :name, :photo, :bio, :posts_counter, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :asc).limit(2)
  end

  def all_posts
    posts.order(:id)
  end
end
