class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    session[:a] = "cc"
    @cc = user_session
  end

  def logout
    redirect_to user_session_url
  end
end
