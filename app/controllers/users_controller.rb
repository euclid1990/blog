class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: :edit
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
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
        flash[:success] = "Welcome to the Ruby on Rails Blog!"
        format.html { redirect_to root_path}
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if (@user.update_attribute('name', user_params[:name])&&@user.update_attribute('phone', user_params[:phone]))
      flash[:success] = "User was successfully updated"
      redirect_to edit_user_path(@user)
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
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
      params.require(:user).permit(:name, :email, :phone, :position_id, :password, :password_confirmation)
    end
    
    def correct_user
      @profile = (current_user[:id].to_s == params[:id].to_s)
      redirect_to root_url if !@profile
    end
end
