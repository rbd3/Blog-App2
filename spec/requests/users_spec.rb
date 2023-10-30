require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get users_path
      expect(response.body).to include('<h1>Welcome</h1>')
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    it 'returns http success' do
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'includes the correct content on the user show page' do
      get user_path(user)
      expect(response.body).to include('<h1>Here list of Users</h1>')
    end
  end
end
