# coding: utf-8
class UsersController < Clearance::UsersController
  before_action :set_user, only: [:show,
                                  :edit,
                                  :update,
                                  :destroy,
                                  :change_password,
                                  :update_password,
                                  :edit_travel]
  before_action -> {disallow_unless_admin_or_user(@user)}, only:
                                                             [:edit,
                                                              :update,
                                                              :destroy,
                                                              :change_password,
                                                              :update_password,
                                                              :edit_travel]
  before_action :ensure_accessible_profile, only: [:show]

  CENTERS = {"de"=> [50.931, 11.272], "at"=> [47.61, 13.78], "ch"=> [46.87, 8.24]}
  ZOOMS = {"de"=> 6, "at"=> 7, "ch"=> 8}
  MARKERS = {"de" => "red", "at" => "red", "ch" => "turquoise"}
  TILES = {
    "de" => "l1sl1s/cjhhq61jt05ka2rn2stnj3ylp",
    "at" => "l1sl1s/cjhhq7s2q23st2spyv8xc4f6t",
    "ch" => "l1sl1s/cjhhqmo6v09dr2so1jciw5pvp"
  }

  # GET /users
  # GET /users.json
  def index
    if current_user
      @users = current_user.visible_for_signed_in_users
    else
      @users = User.are_public.order("upper(name) ASC")
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @center = [@user.latitude, @user.longitude]
    @zoom = ZOOMS[@user[:country]]
    @marker = MARKERS[@user[:country]]

    @alphas = visible_users
    @list = set_list
    @mod, @orga = Event.where(user_id: @user).partition { |e| e.relationship == 'moderation' }
    @tile = TILES[@user[:country]]
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @subnav_active = 'user'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        sign_in @user

        UserMailer.welcome(@user).deliver_now
        UserMailer.new_user(ENV['OFFICE_EMAIL'], @user).deliver_now

        format.html { redirect_to @user, notice: 'Danke! Du bekommst eine E-Mail sobald dein Profil öffentlich zugänglich ist.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        if @user.public_changed? && @user.public?
          UserMailer.user_is_public(@user).deliver_now
        end
        format.html { redirect_to @user, notice: 'Das Profil wurde erfolgreich aktualisiert' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_password
  end

  def update_password
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Das Passwort wurde erfolgreich geändert' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :change_password }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_travel
    @user = User.find(params[:user_id])
    @subnav_active = 'travel'
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Das Profil wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private

  def ensure_accessible_profile
    if @user != current_user && @user.public == false
      redirect_to root_url unless @user.public
    end
    return true
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(
      :name,
      :city,
      :country,
      :email,
      :year_of_birth,
      :website,
      :facebook_link,
      :instagram,
      :twitter,
      :tiktok,
      :password,
      :password_confirmation,
      :public,
      :admin,
      :alpha,
      :recommended_by,
      :video_link,
      :avatar,
      :avatar_cache,
      :remove_avatar,
      :will_travel,
      :pronouns,
      :custom_availability,
      is_available_on: [],
      travels_via: [],
      train_bonus_card: [],
      bookable_as: []
    )
  end
end
