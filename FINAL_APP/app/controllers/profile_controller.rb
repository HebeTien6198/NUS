class ProfileController < ApplicationController
  before_action :set_user
  before_action :set_photo, only: [:editPhoto, :deletePhoto]
  #-----------------------GET--------------------------#
  def profile
    #---Find all records that the user is the one that follow (follower)--#
    @followingRecords = Follow.where(follower: @user)
    #---Find all records that the user is followed (following)--#
    @followerRecords = Follow.where(following: @user)
    #----get following list of current user--------------#
    @followingList = Follow.where(follower: @user)
    #-------------------get all likes------------------#
    @likes = Like.where(User: @user)
  end

  def editProfile
  end

  def editPhoto
  end

  def newPhoto
    @photo = Photo.new
    @image = "assets/default/img/default-img.gif"
  end

  def newAlbum
    @photo = Photo.new
    @image = "assets/default/img/default-img.gif"
  end

  #-------------------------POST--------------------------#
  #--------Log out-------------------#
  def logOut
    redirect_to login_login_url
  end

  #-------edit Basic profile---------#
  def editBasicProfile
    edit = User.new(user_basic_params)
    user = User.where(email: session[:user]["email"]).first
    puts "--------------------------#{user.email}-----------------------------"
    user.firstName = edit.firstName
    user.lastName = edit.lastName
    user.email = edit.email

    if user.save
      puts "---------------------Successfull-----------------------------"
      redirect_to profile_url
    else
      @message = user.errors.messages
    end
  end

  #-------------CHange Password------------#
  def editPassword
    puts "------------------password-------------------------"
    user = User.where(email: session[:user]["email"]).first
    basic = user_password
    #------Check Password----------------
    if user.password != basic["currentPassword"]
      redirect_to editProfile_url
    else
      #------Save new password
      user.password = basic["newPassword"]
      if (user.save)
        #------If save password sucessful---#
        redirect_to profile_url
      else
        #-----if failed-------
        redirect_to editProfile_url
      end
    end
  end

  #----------------------Edit Photo----------------------------#
  def editPhotoServer
    photo = Photo.new(photo_params)
    databasePhoto = @photos.where(id: photo.id).first
    databasePhoto.title = photo.title
    puts "ccccccccccccccccccccccccccccccccccccccccccccccccccc"
    puts "-------------------#{photo.sharingMode}---------------"
    databasePhoto.sharingMode = photo.sharingMode
    databasePhoto.des = photo.des
    if (databasePhoto.save)
      redirect_to editPhoto_path(databasePhoto.id)
    else
      @message = "Something wrong"
    end
  end

  #----------Upload new photo--------------
  def uploadPhoto
    photo = Photo.new(upload_photo_params)
    photo.User = @user
    #set URL

    if (photo.save)
      redirect_to feed_url
    else
      redirect_to profile_url
      puts "------------------------------"
      puts photo.errors.messages
    end
  end

  #------------Delete Photo-----------------------#
  def deletePhoto
    puts "---------------deletePhoto #{@photo.id}------------------"
    #-Delete the photo its selt-#
    begin
      @photo.destroy
    rescue => exception
      puts "-----------------#{exception}-----------------"
    end
    redirect_to profile_url
  end

  #---------------Upload album------------------------#
  def uploadAlbum
    #---------Create a ablum for user--------#
    album = Album.create(User: @user, name: params[:Album]["name"], des: params[:Album]["des"])
    for image in params[:Album]["image"]
      photo = Photo.create(image: image, User: @user)
      albumRecord = AlbumRecord.create(Photo: photo, Album: album)
    end

    puts params[:Album]["image"]
    puts params[:Album]["image"].size
  end

  #--------take login input data from user-------------
  #---Basic Profile---#
  def user_basic_params()
    return params.require(:User).permit(:firstName, :lastName, :email)
  end

  #----------------Edit Album------------------#
  def editAlbum
    @cc = Photo.new
    @image = "assets/default/img/default-img.gif"
    @album = Album.find_by(id: params[:id])
  end

  #---Password Profile---#
  def user_password
    return params.permit(:currentPassword, :newPassword)
  end

  #------------Remove Photo From Album----------------#
  def removePhoto
    albumRecord = AlbumRecord.where(id: params[:id]).first
    albumRecord.delete

    redirect_to request.referrer, notice: "Remove successfull"
  end

  #----------------EditAlbumServer------------------#
  def editAlbumServer
    puts "-------------------------------------"
    puts params
    album = Album.find(params["Album"]["id"])
    album.name = params["Album"]["name"]
    album.des = params["Album"]["des"]
    album.sharingMode = params["Album"]["sharingMode"]
    album.save
    if params["Photo_id"] != nil
      for photo_id in params["Photo_id"]
        albumRecord = AlbumRecord.create(Photo_id: photo_id, Album_id: params["Album"]["id"])
      end
    end
    if params[:Album]["image"] != nil
      for image in params[:Album]["image"]
        photo = Photo.create(image: image, User: @user)
        albumRecord = AlbumRecord.create(Photo: photo, Album: album)
      end
    end

    redirect_to request.referrer, notice: "Update successfull"
  end

  #------------Delete Album-------------------#
  def deleteAlbum
    @album = Album.find_by(id: params[:id])
    @album.delete
  end

  #----Photo Info-----#
  def photo_params
    return params.require(:Photo).permit(:id, :title, :sharingMode, :des)
    puts "ccccccccccccccccccccccccccccccccccccccccccccccccccc"
    puts "-------------------#{params.require(:Photo).permit(:id, :title, :sharingMode, :des)}---------------"
  end

  def upload_photo_params
    return params.require(:Photo).permit(:title, :sharingMode, :image, :des)
  end

  #--------------Upload Avatar--------------------#
  #--------From exiting photo---------#
  def updateAvatarFromPhoto
    @user.avatar = params["avatar"]
    @user.save
    redirect_to profile_url
  end

  #-------------------------------Before Action-----------------------------------------#
  def set_user
    if session[:user]
      @user = User.where(id: session[:user]["id"]).first
      @name = session[:user]["firstName"]
      @fullName = "#{session[:user]["firstName"]} #{session[:user]["lastName"]}"
      @avatar = @user.avatar
      @photos = @user.photos
      @albums = @user.albums
      @editAvatarAction = "/updateAvatarFromPhoto";
    else
      redirect_to login_login_url
    end
  end

  def set_photo
    @photo = @photos.where(id: params[:id]).first
    if @photo == nil
      puts "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
      redirect_to profile_url
    end
  end
end
