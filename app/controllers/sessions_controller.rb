class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #raise params.inspect
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
  
end
