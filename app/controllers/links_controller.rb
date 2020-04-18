class LinksController < ApplicationController
  include Links
  include Visits

  before_action :find_link, only: :show

  def index
    @links = Link.all.paginate(page: params[:page], per_page: 10).sort_by_date
  end

  def show
    create_visit(request.remote_ip, @link)
    redirect_to @link.source_link
  end

  def new
    @link = Link.new
  end

  def create
    if link_exist?(permitted_params[:source_link])
      @link = search_link(permitted_params[:source_link])
      respond_to { |format| format.js }
    else
      @link = Link.create(links_params)
      respond_to { |format| format.js }
    end
  end

  private

  def short_url
    encode(permitted_params[:source_link])
  end

  def find_link
    @link = Link.find_by(short_url: params[:short_url])
  end

  def permitted_params
    params.require(:link).permit(:source_link)
  end

  def links_params
    { source_link: permitted_params[:source_link], short_url: short_url }
  end
end
