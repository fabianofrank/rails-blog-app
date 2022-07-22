require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get '/users/60/posts' } # user_posts_url(@user)

    it 'returns response status success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders template success' do
      expect(response.body).to match(/post/)
    end

    it 'shows placeholder text success' do
      expect(response.body).to include('post')
    end
  end
end
