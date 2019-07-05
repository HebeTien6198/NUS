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
    followRecord = Follow.new(set_follow_record)

    if followRecord.save
      puts "-------------------Successs-------------------"
      redirect_to discover_url
    else
      puts "------ccccccccccccccccccccccc---------------"
    end
  end

  def unfollow
    followRecord = Follow.where(following_id: params.require(:Follow)["following_id"]).where(follower_id: params.require(:Follow)["follower_id"]).first
    puts "---------------------------"
    puts followRecord
    if followRecord.delete
      puts "-------------------Successs-------------------"
      redirect_to discover_url
    else
      puts "------ccccccccccccccccccccccc---------------"
    end
  end

  def like
    puts params
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
end
