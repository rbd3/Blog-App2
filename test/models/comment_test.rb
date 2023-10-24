require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'should create valid comment' do
    user = User.create(name: 'Henry')
    post = Post.create(author: user, title: 'Test')
    comment = Comment.create(post:, text: 'Text', user:)
    assert comment.valid?
  end

  test 'should not create comment if no user' do
    user = User.create(name: 'Henry')
    post = Post.create(author: user, title: 'Test')
    comment = Comment.create(post:, text: 'Text')
    assert_not comment.valid?
  end

  test 'should not create comment if no post' do
    user = User.create(name: 'Henry')
    comment = Comment.create(user:, text: 'Text')
    assert_not comment.valid?
  end

  test 'should update comments_counter correctly' do
    user = User.create(name: 'Grace')
    post = Post.create(author: user, title: 'Test', comments_counter: 0, likes_counter: 0)
    Comment.create(post:, user:, text: 'A comment')
    assert_equal 1, post.comments_counter
  end
end
