class UsersController < ApplicationController
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create   
    @user = User.new(user_params)   
  
    respond_to do |format|   
      if @user.save   
        format.html { redirect_to users_url, notice: 'User was successfully created.' }      
      else   
        format.html { render :new }   
        format.json { render json: @user.errors, status: :unprocessable_entity }   
      end   
    end   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
