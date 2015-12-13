require 'rails_helper'

describe StaticPagesController, :type => :controller do
  context '#home' do
    it 'should get home' do
      get :home

      expect(response.status).to eq(200)
    end
  end

  context '#help' do
    it 'should get help' do
      get :help

      expect(response.status).to eq(200)
    end
  end

  context '#about' do
    it 'should get about' do
      get :about

      expect(response.status).to eq(200)
    end
  end
end
