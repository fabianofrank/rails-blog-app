require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path(1) } # get(:users:user_id:posts)

    it 'returns response status success' do
      expect(response).to have_http_status(:ok)
    end

    # it 'renders template success' do
    #   expect(response).to render_template('index')
    # end

    it 'shows placeholder text success' do
      expect(response.body).to include('Posts#index')
    end
  end
end
