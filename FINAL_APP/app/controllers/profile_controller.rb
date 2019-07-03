class ProfileController < ApplicationController
  before_action :set_user
  before_action :set_photo, only: [:editPhoto, :deletePhoto]
  #-----------------------GET--------------------------#
  def profile
  end

  def editProfile
  end
  
  def editPhoto
  end

  def newPhoto
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
    edit = User.new(user_basic_params);
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
    databasePhoto = Photo.where(id: photo.id).first
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
    photo.url = photo.image.url

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
    puts "---------------deletePhoto #{@photo}------------------"
    if @photo.delete
      redirect_to profile_url
    else
    end
  end

  #--------take login input data from user-------------
  #---Basic Profile---#
  def user_basic_params()
    return params.require(:User).permit(:firstName, :lastName, :email)
  end

  #---Password Profile---#
  def user_password
    return params.permit(:currentPassword, :newPassword)
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

  #-------------------------------Before Action-----------------------------------------#
  def set_user
    if session[:user]
      @user = User.where(id: session[:user]["id"]).first
      @name = session[:user]["firstName"]
      @fullName = "#{session[:user]["firstName"]} #{session[:user]["lastName"]}"
      @avatar = @user.avatar
      @photos = @user.photos
    else
      redirect_to login_login_url
    end
    
  end

  def set_photo
    @photo = @photos.where(id: params[:format]).first

  end
end
