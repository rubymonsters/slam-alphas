class MapsController < ApplicationController

CENTERS = {"de"=> [50.931, 11.272], "at"=> [47.61, 13.78], "ch"=> [46.87, 8.24]}
ZOOMS = {"de"=> 6, "at"=> 7, "ch"=> 7}

  def show
  	if ["de", "at", "ch"].include?(map_params[:country])
      @users = User.where(country: map_params[:country])
      @center = CENTERS[map_params[:country]]
      @zoom = ZOOMS[map_params[:country]]
      @cities = User.all.pluck(:city).uniq
    else
    	render plain: "404 Not Found", status: 404
    end
  end

  private

  def map_params
    params.permit(:country)
  end


end
