class LinksController < ApplicationController
  def show
    link = Link.find_by(short_url: request.original_url)
    redirect_to link.source_link
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(links_params)
    respond_to { |format| format.js }
  end

  private

  def links_params
    params.require(:link).permit(:source_link)
  end
end
