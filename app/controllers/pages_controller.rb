class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_page

  def show; end

  def edit; end

  private

  def set_page
    @page = Page.find(params[:id])
  end
end
