class LinksController < ApplicationController
  include Links

  def show
    link = Link.find_by(short_url: request.original_url)
    redirect_to link.source_link
  end

  def new
    @link = Link.new
  end

  def create
    if link_exist?(links_params['source_link'])
      @link = search_link(links_params['source_link'])
      respond_to { |format| format.js }
    else
      @link = Link.create(links_params)
      respond_to { |format| format.js }
    end
  end

  private

  def links_params
    params.require(:link).permit(:source_link)
  end
end
