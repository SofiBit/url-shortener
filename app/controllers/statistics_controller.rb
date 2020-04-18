class StatisticsController < ApplicationController
  before_action :find_link, only: %i[show_count show_countries]

  def index
    render json: { 'All redirections' => Visit.count }
  end

  def show_count
    render json: { 'Unique redirections' => @link.visits.count  }
  end

  def show_countries
    render json: @link.visits.group(:country).count
  end

  private

  def find_link
    @link = Link.find(params[:link_id])
  end
end
