class DiscoversController < ApplicationController
  def index
     #--------------------Search-------------------------#
     @photos = Photo.where(sharing_mode: "is_public").where("title like ?", "%#{params["title"]}%")
     puts "--------------#{@photos.count}------------------"
 
     #---Find all records that the user is the one that follow other (follower)--#
     @followingRecords = Follow.where(follower: @user)
 
     #--Add following id to a hashtable--#
     @followings = Hash.new
     for f in @followingRecords
       @followings[f.following_id] = true
     end
     #---Find all records that the user is followed (following)--#
     @followerRecords = Follow.where(following: @user)
 
     #--------------------Get all album-----------------------#
     @albums = Album.all
  end
end
