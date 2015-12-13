require 'rails_helper'

describe UsersController, :type => :controller do
  render_views

  context '#new' do
    it 'should get new' do
      get :new

      expect(response.status).to eq(200)
      expect(response.body).to have_selector('title', text: "Sign up | Ruby on Rails Tutorial Sample App", visible: false)
    end
  end
end