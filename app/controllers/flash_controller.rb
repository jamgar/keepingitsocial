class FlashController < ApplicationController
  def dismiss
    flash.clear
  end
end
