require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'recent_posts should return the 3 most recent posts' do
    user = User.create(name: 'Hugo', posts_counter: 0)
    post1 = user.posts.create(title: 'Post 1', created_at: 2.days.ago, comments_counter: 1, likes_counter: 1)
    post2 = user.posts.create(title: 'Post 2', created_at: 1.day.ago, comments_counter: 1, likes_counter: 1)
    post3 = user.posts.create(title: 'Post 3', created_at: Time.current, comments_counter: 1, likes_counter: 1)
    post4 = user.posts.create(title: 'Post 4', created_at: 3.days.ago, comments_counter: 1, likes_counter: 1)

    recent_posts = user.recent_posts

    assert_equal [post3, post2, post1], recent_posts
  end

  test 'should be valid with a name and non-negative posts_counter' do
    user = User.new(name: 'John Doe', posts_counter: 0)
    assert user.valid?

    user.posts_counter = -1
    assert_not user.valid?

    user.name = nil
    assert_not user.valid?
  end
end
