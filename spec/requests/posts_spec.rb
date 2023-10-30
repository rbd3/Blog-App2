require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    it 'Return Http success' do
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get user_posts_path(user_id: user.id)
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get user_posts_path(user_id: user.id)
      expect(response.body).to include('<h1>Posts index</h1>')
    end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
    it 'returns http success' do
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end

    it 'includes the correct content on the post show page' do
      get user_post_path(user, post)
      expect(response.body).to include('<h1>Here is post list</h1>')
    end
  end
end
