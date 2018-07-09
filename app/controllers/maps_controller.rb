class MapsController < ApplicationController
  CENTERS = {"de"=> [50.931, 11.272], "at"=> [47.61, 13.78], "ch"=> [46.87, 8.24]}
  ZOOMS = {"de"=> 6, "at"=> 7, "ch"=> 8}
  MARKERS = {"de" => "red", "at" => "red", "ch" => "turquoise"}
  TILES = {
    "de" => "l1sl1s/cjhhq61jt05ka2rn2stnj3ylp",
    "at" => "l1sl1s/cjhhq7s2q23st2spyv8xc4f6t",
    "ch" => "l1sl1s/cjhhqmo6v09dr2so1jciw5pvp"
  }

  def show
    if ["de", "at", "ch"].include?(map_params[:country])
      @users = User.where(public: true, country: map_params[:country])
      @center = CENTERS[map_params[:country]]
      @zoom = ZOOMS[map_params[:country]]
      @cities = User.all.pluck(:city).uniq
      @marker = MARKERS[map_params[:country]]
      @country = map_params[:country]
      @tile = TILES[map_params[:country]]
    else
      render plain: "404 Not Found", status: 404
    end

    @alphas = visible_users
    @list = set_list
  end

  private

  def map_params
    params.permit(:country)
  end
end
