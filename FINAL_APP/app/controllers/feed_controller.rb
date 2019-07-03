class FeedController < ApplicationController
  before_action :set_user
  def feed
    if session[:user]
      @user = User.where(id: session[:user]["id"]).first
      @name = @user.firstName
      @photos = @user.photos
      @avatar = @user.avatar
      puts "---------------------Photos------------------------"
      puts @photos
    else
      redirect_to login_login_url
    end
  end
  def logOut
    session.clear
    redirect_to login_url
  end


  def set_user
    if session[:user]
      @user = User.where(id: session[:user]["id"]).first
      @name = session[:user]["firstName"]
      @fullName = "#{session[:user]["firstName"]} #{session[:user]["lastName"]}"
    else
      redirect_to login_login_url
    end
    
  end
end
