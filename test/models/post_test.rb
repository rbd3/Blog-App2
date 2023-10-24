require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should be valid with valid attributes' do
    user = User.create(name: 'John')
    post = Post.new(author: user, title: 'Hello', comments_counter: 0, likes_counter: 0)
    assert post.valid?
  end

  test 'should not be valid without a title' do
    user = User.create(name: 'Alice')
    post = Post.new(author: user, comments_counter: 0, likes_counter: 0)
    assert_not post.valid?
  end

  test 'title should not exceed 250 characters' do
    user = User.create(name: 'Bob')
    post = Post.new(author: user, title: 'A' * 251, comments_counter: 0, likes_counter: 0)
    assert_not post.valid?
  end

  test 'comments_counter should be an integer greater than or equal to zero' do
    user = User.create(name: 'Eve')
    post = Post.new(author: user, title: 'Example', comments_counter: -1, likes_counter: 0)
    assert_not post.valid?
  end

  test 'likes_counter should be an integer greater than or equal to zero' do
    user = User.create(name: 'Frank')
    post = Post.new(author: user, title: 'Test', comments_counter: 0, likes_counter: -1)
    assert_not post.valid?
  end

  test 'increment_user_posts_counter should update user posts_counter' do
    user = User.create(name: 'Jane', posts_counter: 0)
    post = Post.create(author: user, title: 'Sample', comments_counter: 0, likes_counter: 0)
    
    user.reload # Reload the user to get the updated posts_counter value

    assert_equal 1, user.posts_counter
  end
end
