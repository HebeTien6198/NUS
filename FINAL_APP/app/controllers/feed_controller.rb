class FeedController < ApplicationController
  def feed
    if session[:user]
      @name = session[:user]
    else
      redirect_to login_login_url
    end
  end
end
