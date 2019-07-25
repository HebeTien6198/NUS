class ProfileController < ApplicationController
  before_action :authenticate_user!
  def index
    @photos = current_user.photos
    @albums = current_user.albums


    #---Find all records that the user is the one that follow (follower)--#
    @following_records = Follow.where(follower: @user)
    #---Find all records that the user is followed (following)--#
    @follower_records = Follow.where(following: @user)
    #----get following list of current user--------------#
    @following_list = Follow.where(follower: @user)

  end

  def change_avatar
    current_user.avatar = params[:avatar]
    if current_user.save
      redirect_to request.referrer, notice: "You're being redirected"
    else
      puts current_user.error.message
    end
  end
end
