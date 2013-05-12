class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "You have successfully logged in!"
      redirect_to root_path
    else
      @user_session.errors.add(:login, 'invalid')
      render action: :new
    end
  end

  def destroy
    if current_user_session
      current_user_session.destroy
      flash[:notice] = "You have successfully logged out!"
    end
    redirect_to root_path
  end
end
