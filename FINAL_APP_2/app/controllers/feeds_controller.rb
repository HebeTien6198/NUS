class FeedsController < ApplicationController
  before_action :authenticate_user!
  def index
    #---Get all following record of current user---#
    @following_records = Follow.where(follower: @user)

    #---Define emmpty array for User followings and their photos
    @followings = []
    @photos = []
    @albums = []
    #----Get all following people---#
    for following in @following_records
      @followings.push(following.following)
    end

    #----Get all their photos----#
    for following in @followings
      for p in following.photos
        #get all private and public, not album_mode
        if p.is_private? or p.is_public?
          @photos.push(p)
        end
      end
    end

    #----Get all their albums----#
    for following in @followings
      for a in following.albums
        @albums.push(a)
      end
    end
  end
end
