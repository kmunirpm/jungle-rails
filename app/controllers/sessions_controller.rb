class SessionsController < ApplicationController
  
  def new

  end

  def create
    if user = User.authenticate_with_credentials(params[:login][:email], params[:login][:password])
      session[:user_id] = user.id
      puts "logged in as #{user.id}"
      redirect_to '/'
    else
      redirect_to '/login'
      puts "login failed", params[:login][:password]
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end