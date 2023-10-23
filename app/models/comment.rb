class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'
  has_many :likes

  after_create :increment_comment_posts_counter

  def increment_comment_posts_counter
    post.update(comments_counter: post.comments.count)
  end
end
