class MapsController < ApplicationController
  def show
    @users = User.where(country: map_params[:country])

  end

  private

  def map_params
    params.permit(:country)
  end


end
