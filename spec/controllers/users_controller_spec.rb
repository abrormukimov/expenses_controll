require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before { sign_in FactoryBot.create(:user) }

  describe 'GET #index' do
    it 'Renders users index page' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end
end
