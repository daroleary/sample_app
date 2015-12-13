require 'rails_helper'

describe StaticPagesController, :type => :controller do
  render_views

  context '#home' do
    it 'should get home' do
      get :home

      expect(response.status).to eq(200)
      expect(response.body).to have_selector('title', text: "Ruby on Rails Tutorial Sample App", visible: false)
    end
  end

  context '#help' do
    it 'should get help' do
      get :help

      expect(response.status).to eq(200)
      expect(response.body).to have_selector('title', text: "Help | Ruby on Rails Tutorial Sample App", visible: false)
    end
  end

  context '#about' do
    it 'should get about' do
      get :about

      expect(response.status).to eq(200)
      expect(response.body).to have_selector('title', text: "About | Ruby on Rails Tutorial Sample App", visible: false)
    end
  end

  context '#contact' do
    it 'should get contact' do
      get :contact

      expect(response.status).to eq(200)
      expect(response.body).to have_selector('title', text: "Contact | Ruby on Rails Tutorial Sample App", visible: false)
    end
  end
end
