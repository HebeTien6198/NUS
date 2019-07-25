class PeopleController < ApplicationController
  def show
    @discover_user = User.find(params[:id])
    @full_name_discover = "#{@discover_user.first_name} #{@discover_user.last_name}"

    #---Find all records that the discover user is the one that follow other (follower)--#
    @following_records = Follow.where(follower: @discover_user)

    #---Find all records that the discover user is followed (following)--#
    @follower_records = Follow.where(following: @discover_user)

    @is_followed = @follower_records.where(follower: @user).first != nil ? true : false

    #----get following list of current user--------------#
    @following_list = Follow.where(follower: @user)

    #get Photo and Album
    if (@is_followed)
      #get all photo and album
      @photos = @discover_user.photos
      @albums = @discover_user.albums
    else
      #just get public photo
      @photos = @discover_user.photos.is_public
      @albums = @discover_user.albums.is_public
    end
  end
end
