require 'spec_helper'
require 'rails_helper'

describe StatisticsController, type: :controller do
  context 'GET #index' do
    it 'should return response status 200' do
      get :index, format: :json
      expect(response.status).to eq(200)
    end
  end

  context 'GET #show_count' do
    let(:link) { create(:link) }

    it 'should return response status 200' do
      get :show_count, format: :json, params: { link_id: link.id }
      expect(response.status).to eq(200)
    end
  end

  context 'GET #show_countries' do
    let(:link) { create(:link) }

    it 'should return response status 200' do
      get :show_countries, format: :json, params: { link_id: link.id }
      expect(response.status).to eq(200)
    end
  end
end
