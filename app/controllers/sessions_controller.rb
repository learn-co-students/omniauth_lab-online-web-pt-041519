class SessionsController < ApplicationController

  def create
    if auth
      # They logged in via OAuth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'welcome/home'
    end
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

end
