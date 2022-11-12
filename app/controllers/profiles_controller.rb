class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def edit; end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.turbo_stream
        format.html do
          redirect edit_page_path(@profile.user.page), notice: 'Profile was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:display_name, :bio, :user_id, :avatar)
  end
end
