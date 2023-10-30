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
end
