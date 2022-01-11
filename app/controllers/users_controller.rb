class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create   
    @user = User.new(user_params)   
  
    respond_to do |format|   
      if @user.save   
        format.html { redirect_to '/register', notice: 'User successfully created.' }
        session[:user_id] = @user.id
      else   
        format.html { render :new }   
        format.json { render json: @user.errors, status: :unprocessable_entity }   
      end   
    end   
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
