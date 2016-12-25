class MapsController < ApplicationController

CENTERS = {"de"=> [50.931, 11.272], "at"=> [47.61, 13.78], "ch"=> [46.87, 8.24]}
ZOOMS = {"de"=> 6, "at"=> 7, "ch"=> 7}
MARKERS = {"de" => "red", "at" => "blue", "ch" => "turquoise"}

  def show
    if ["de", "at", "ch"].include?(map_params[:country])
      @users = User.where(country: map_params[:country])
      @center = CENTERS[map_params[:country]]
      @zoom = ZOOMS[map_params[:country]]
      @cities = User.all.pluck(:city).uniq
      @marker = MARKERS[map_params[:country]]
    else
      render plain: "404 Not Found", status: 404
    end

    @alphas = User.all.sort_by {|x| x.name }
    @list = Array.new

    @alphas.each do |x|
      unless @list.include? x.name.first
        @list.push(x.name.first)
      end
    end
  end

  private

  def map_params
    params.permit(:country)
  end

end
