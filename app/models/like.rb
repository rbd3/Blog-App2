class Like < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    belongs_to :post, foreign_key: 'post_id'

    after_create :increment_like_posts_counter

  def increment_like_posts_counter
    post.update(likes_counter: post.likes.count)
  end
end
