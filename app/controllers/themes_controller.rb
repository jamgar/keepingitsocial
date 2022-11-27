class ThemesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_theme

  def edit  
  end

  def update
    if @theme.update(theme_params)
      redirect_to edit_page_path(@theme.page)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def theme_params
      params.require(:theme).permit(:background_color, :button_color, :text_color, :page_id)
    end

    def set_theme
      @theme = Theme.find_or_create_by(page_id: params[:page_id])
    end
end
