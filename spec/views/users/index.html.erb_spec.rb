require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
    let!(:user1) { User.create(name: 'user1', photo: 'user1.jpg') }
    let!(:user2) { User.create(name: 'user2', photo: 'user2.jpg') }
    let!(:post1) { Post.create(author: user1) }
    let!(:post2) { Post.create(author: user1) }
    scenario 'Displaying User Information on the Index Page' do
      visit users_path
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
      expect(page).to have_css("img[src*='user1.jpg']")
      expect(page).to have_css("img[src*='user2.jpg']")
      expect(page).to have_content("Number of posts: #{user1.posts.count}")
      expect(page).to have_content('Number of posts: 0') # User2 has no posts
    end
=begin
    scenario 'Clicking on a User Redirects to Their Show Page' do
      visit users_path
      click_link user1.name
      expect(current_path).to eq(user_path(user1))
    end
=end
end
