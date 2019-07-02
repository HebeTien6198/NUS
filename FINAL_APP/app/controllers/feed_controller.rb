class FeedController < ApplicationController
  def feed
    if session[:user]
      @user = session[:user]
      @name = @user["firstName"]
    else
      redirect_to login_login_url
    end
  end
  def logOut
    session.clear
    redirect_to login_url
  end
end
