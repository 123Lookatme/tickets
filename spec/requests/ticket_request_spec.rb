# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tickets', type: :request do

  describe 'GET /index' do
    it 'returns http success' do
      get '/tickets'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:ticket) { create(:ticket) }

    it 'returns http success' do
      get "/tickets/#{ticket.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
