require 'rails_helper'

describe StaticPagesController, :type => :controller do
  render_views

  context '#home' do
    it 'should get home' do
      get :home

      expect(response.status).to eq(200)
      expect(response.body).to have_content("Home | Ruby on Rails Tutorial Sample App")
    end
  end

  context '#help' do
    it 'should get help' do
      get :help

      expect(response.status).to eq(200)
      expect(response.body).to have_content("Help | Ruby on Rails Tutorial Sample App")
    end
  end

  context '#about' do
    it 'should get about' do
      get :about

      expect(response.status).to eq(200)
      expect(response.body).to have_content("About | Ruby on Rails Tutorial Sample App")
    end
  end
end
