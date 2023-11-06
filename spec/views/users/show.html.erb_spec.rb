require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  let!(:user) { User.create(name: 'Test User', bio: 'Test Bio', photo: 'test.jpg') }
  let!(:post1) { Post.create(title: 'Post 1', text: 'Text for Post 1', author: user) }
  let!(:post2) { Post.create(title: 'Post 2', text: 'Text for Post 2', author: user) }
  let!(:post3) { Post.create(title: 'Post 3', text: 'Text for Post 3', author: user) }
  let!(:post4) { Post.create(title: 'Post 4', text: 'Text for Post 4', author: user) }

  scenario 'Displaying User Information on the Show Page' do
    visit user_path(user)

    expect(page).to have_css("img[src*='test.jpg']") # Profile picture
    expect(page).to have_content('Test User') # Username
    expect(page).to have_content('Test Bio') # Bio
    expect(page).to have_content("Number of posts: #{user.posts.count}") # Number of posts
  end

  scenario 'Displays the first 3 posts' do
    visit user_path(user)

    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
    expect(page).to have_content('Post 4')
  end

  scenario 'Redirecting to All post ' do
    visit user_path(user)

    click_link 'See All Posts'
    expect(current_path).to eq(user_posts_path(user))
  end

  scenario 'Redirects to the post show page when a post is clicked' do
    visit user_path(user)

    click_link post2.title
    expect(current_path).to eq(user_post_path(user_id: post2.author_id, id: post2.id))
  end
end
