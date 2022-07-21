class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  validates :title, :text, presence: true
  validates :text, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_posts
  after_destroy :decrement_posts

  def increment_posts
    author.increment!(:posts_counter)
  end

  def decrement_posts
    author.decrement!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
