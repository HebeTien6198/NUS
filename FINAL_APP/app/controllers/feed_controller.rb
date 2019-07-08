class FeedController < ApplicationController
  before_action :set_user
  before_action :set_discover_user, only: [:info]
  
  
  #--------------------GET----------------#
  #-----feed------#
  def feed
    #---Get all following record of current user---#
    @followingRecords = Follow.where(follower: @user)

    #---Define emmpty array for User followings and their photos
    @followings = []
    @photos = []

    #----Get all following people---#
    for following in @followingRecords
       @followings.push(following.following)
    end

    #----Get all their photos----#
    for following in @followings
      for p in following.photos
        @photos.push(p)
      end
    end

    #get all Photo that user like
    likeRecords = @user.likes
    puts "--------Like Records-------------"
    if (likeRecords.first != nil)

      puts likeRecords.first.User_id
    end
    puts "------Like Records--------------"
    @likes = Hash.new
    for l in likeRecords
      puts "-----Photo Records--------------"
      puts l.Photo_id
      @likes[l.Photo_id] = true
    end



    #--------------------Get all album-----------------------#
    @albums = Album.all
    
  end

  #------Discover----#
  def discover
    @people = User.all
    @photos = Photo.where(sharingMode: "isPublic")
    puts "--------------#{@photos}------------------"

    #---Find all records that the user is the one that follow other (follower)--#
    @followingRecords = Follow.where(follower: @user)

    #--Add following id to a hashtable--#
    @followings = Hash.new
    for f in @followingRecords
      @followings[f.following_id] = true;
    end
    #---Find all records that the user is followed (following)--#
    @followerRecords = Follow.where(following: @user)
  end


  def info
    @fullNameDiscover = "#{@discoverUser.firstName} #{@discoverUser.lastName}" 
    
    #---Find all records that the discover user is the one that follow other (follower)--#
    @followingRecords = Follow.where(follower: @discoverUser)

    #---Find all records that the discover user is followed (following)--#
    @followerRecords = Follow.where(following: @discoverUser)
    
    @isFollowed = @followerRecords.where(follower: @user).first != nil ? true : false

    if (@isFollowed)
      #get all photo
      puts "scscscscscscscscsc----#{@isFollowed}--------------------------------------------------------"
      @photos = @discoverUser.photos
    else
      #just get public photo
      puts "--------------------#{@isFollowed}--------------------------------------------------"
      @photos = @discoverUser.photos.isPublic
    end
    
  end

  def logOut
    session.clear
    redirect_to login_url
  end



  def follow
    followRecord = Follow.new
    followRecord.follower_id = params[:follower_id]
    followRecord.following_id = params[:following_id] 
    if followRecord.save
      puts "-------------------Successs-------------------"
    else
      puts "------ccccccccccccccccccccccc---------------"
    end
  end

  def unfollow
    followRecord = Follow.where(following_id: params["following_id"]).where(follower_id: params["follower_id"]).first
    followRecord.follower_id = params[:follower_id]
    followRecord.following_id = params[:following_id] 
    puts "---------------------------"
    puts followRecord
    if followRecord.delete
      puts "-------------------Successs-------------------"
    else
      puts "------ccccccccccccccccccccccc---------------"
    end
  end

  def like
    puts params
    like = Like.new
    like.User_id = params[:User_id]
    like.Photo_id = params[:Photo_id]
    if like.save
      # redirect_to feed_url
    end
  end

  def unlike
    puts "-----------"
    puts params
     like = Like.where(User_id: params[:User_id]).where(Photo_id: params[:Photo_id]).first
     if like.delete
      #  redirect_to feed_url
    end
  end


  def CreatePhotoComments
    comment = PhotoComment.new
    comment.User_id = @user.id
    comment.Photo_id = params[:Photo_id]
    comment.content = params[:content]
    if (comment.save)

    else
      puts "-------------------------------------"
    end
  end
  #-------------------BEFORE ACTION---------------------------#
  def set_user
    if session[:user]
      @user = User.where(id: session[:user]["id"]).first
      @name = session[:user]["firstName"]
      @fullName = "#{session[:user]["firstName"]} #{session[:user]["lastName"]}"
      @avatar = @user.avatar
    else
      redirect_to login_login_url
    end
    
  end

  def set_discover_user
    @discoverUser = User.where(id: params[:format]).first

  end

  def set_follow_record
    return params.require(:Follow).permit(:follower_id, :following_id) 
  end

  def set_like_params
    return params.require(:Like).permit(:User_id, :Photo_id)
  end
end
