require 'spec_helper'
require 'rails_helper'
require 'benchmark'

describe LinksController, type: :controller do
  describe "GET #index" do
    it "should get response status 200" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:link) { create(:link) }

    it "should redirect to source link" do
      get :show, { params: { short_url: link.short_url } }
      response.should redirect_to link.source_link
    end

    it "should add one visit" do
      expect{
        get :show, { params: { short_url: link.short_url } }
     }.to change(Visit, :count).by(1)
    end

    it "should be fast" do
      result = Benchmark.measure do
        get :show, { params: { short_url: link.short_url } }
      end
      expect(result.real < 0.1).to be true
    end
  end

  describe "GET #new" do
    it "should render new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    source_link_valid = "https://upyachka.ru"
    source_link_invalid = "testhttp://test"

    it "should be success" do
      post :create, format: :js, params: { link: { source_link: source_link_valid } }
      expect(response.status).to eq(200)
    end

    it "should create new link" do
      expect{
        post :create, format: :js, params: { link: { source_link: source_link_valid } }
     }.to change(Link, :count).by(1)
    end

    it "should not be create new link" do
      expect{
        post :create, format: :js, params: { link: { source_link: source_link_invalid } }
     }.to change(Link, :count).by(0)
    end
  end
end
