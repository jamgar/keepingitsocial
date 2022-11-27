class UsersController < ApplicationController
  layout 'public'
  def show
    @user = User.find_by(username: params[:id])
  end
end
