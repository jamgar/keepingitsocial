class ElementsController < ApplicationController
  before_action :set_page
  before_action :set_element, only: %i[edit update destroy move]

  def new
    @element = @page.elements.build(element_type: params[:element_type])
  end

  def edit; end

  def create
    @element = @page.elements.build(element_params)
    # @element.position = 1 + (@page.elements.maximum(:position) || 0)

    respond_to do |format|
      if @element.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @element.update(element_params)
        format.turbo_stream
        format.html do
          redirect edit_page_path(@page), notice: "#{@element.element_type.capitalize} was successfully updated."
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @element.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  def move
    @element.insert_at(params[:position].to_i)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_page
    @page = Page.find(params[:page_id])
  end

  def set_element
    @element = @page.elements.find(params[:id])
  end

  def element_params
    params.require(:element).permit(
      :element_type,
      :title,
      :url,
      :position,
      :page_id
    )
  end
end
