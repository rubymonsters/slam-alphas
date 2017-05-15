class UsersController < Clearance::UsersController
  skip_before_action :redirect_signed_in_users, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :change_password, :update_password]
  before_action  -> {disallow_unless_admin_or_user(@user)}, only: [:edit, :update, :destroy, :change_password, :update_password]
  before_action :disallow_unless_admin, only: [:new, :create]

  CENTERS = {"de"=> [50.931, 11.272], "at"=> [47.61, 13.78], "ch"=> [46.87, 8.24]}
  ZOOMS = {"de"=> 6, "at"=> 7, "ch"=> 7}
  MARKERS = {"de" => "red", "at" => "blue", "ch" => "turquoise"}

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @center = CENTERS[@user[:country]]
    @zoom = ZOOMS[@user[:country]]
    @marker = MARKERS[@user[:country]]

    @alphas = visible_users
    @list = Array.new

    @alphas.each do |x|
      unless @list.include? x.name.first
        @list.push(x.name.first)
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
        format.html { redirect_to @user, notice: 'Password was successfully changed.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :change_password }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :city, :country, :email, :year_of_birth, :website, :facebook_link, :password, :password_confirmation, :public, :admin, :alpha, :recommended_by)
    end
end
