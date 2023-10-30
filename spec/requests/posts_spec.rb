require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "GET /posts" do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      
    it "Return Http success" do
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
end
