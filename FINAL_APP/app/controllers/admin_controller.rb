class AdminController < ApplicationController

    before_action :set_target_user, only: [:show, :edit, :update, :destroy]
    before_action :set_user
    #-------------------Manage User--------------------------#
    def admin
        if session[:user] == nil
            redirect_to login_path
        elsif session[:admin] == nil
            redirect_to feed_path
        end
        @user = session[:user]
        @name = @user["firstName"]
        @Users = User.all
        for user in @Users
            puts "==========================================="
            puts user.email
        end
    end

    #edit.1
    def edit
    end

    #--------Edit User----------#
    def updateProfile
        editUser = User.new(edit_user_params)
        user = User.where(id: editUser.id).first
        user.email = editUser.email
        user.password = editUser.password
        user.firstName = editUser.firstName
        user.lastName = editUser.lastName

        if (user.save)
          redirect_to request.referrer, notice: "You're being redirected"
        end

        
    end

    #----Edit Avatar----

    def  updateAvatar
      editUser = User.find(params["id"])
      editUser.avatar = params["avatar"]
      if editUser.save
        redirect_to request.referrer, notice: "You're being redirected"
      end
    end


    
    #-------------------------Manage Photo-----------------------#
    def managePhoto
        @photos = Photo.all
    end

    def editPhoto
      @photo = Photo.find(params[:id])
    end
    #-----Edit Photo-----------#
    def uploadPhoto
      editPhoto = Photo.find(params["Photo"]["id"])
      editPhoto.title = params["Photo"]["title"]
      editPhoto.des = params["Photo"]["des"]
      editPhoto.sharingMode = params["Photo"]["sharingMode"]
      if editPhoto.save
        redirect_to request.referrer, notice: "You're being redirected"
      end
    end

    #---------------DeletePhoto--------------#
    def deletePhoto
      deletePhoto = Photo.find(params[:id])
      if deletePhoto.destroy
        redirect_to admin_managePhoto_url
      end
    end

    #-----------------------Manage Album--------------------------#
    def manageAlbum
      @albums = Album.all
    end

    def editAlbum
      @album = Album.find(params[:id])
    end

    #----------------Edit Album-----------#
    def updateAlbum
      updatedAlbum = Album.find(params[:Album]["id"])
      updatedAlbum.name = params[:Album]["name"]
      updatedAlbum.des = params[:Album]["des"]
      updatedAlbum.sharingMode = params[:Album]["sharingMode"]

      #-----Add some photo to album------#
      if params[:Album]["image"] != nil
        for image in params[:Album]["image"]
          photo = Photo.create(image: image, User: @user)
          albumRecord = AlbumRecord.create(Photo: photo, Album: updatedAlbum)
        end
      end
      if updatedAlbum.save
        redirect_to request.referrer, notice: "You're being redirected"
      end
    end

    #-----------------Delete Album-------------#
    def deleteAlbum
      deletedAlbum = Album.find(params[:id])
      puts "---------------------------------------"
      puts deletedAlbum.id
      if deletedAlbum.destroy
        redirect_to admin_manageAlbum_url, notice: "You're being redirected"
      end
      puts "ccccccccccc"
    end

    #----------------Remove Photo-----------------#
    def removePhotoFromAlbum
      albumRecord = AlbumRecord.find(params[:id]);
      if albumRecord.destroy
        redirect_to request.referrer, notice: "You're being redirected"
      end
    end


    #---------------------------PRIVATE-------------------------------#
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_target_user
      @targetUser = User.where(id: params[:id]).first
      @targetAvatar = @targetUser.avatar
      @photos = @targetUser.photos
      @editAvatarAction = "/updateAvatarFromAdmin";
      puts "---------------------------------------------------------------"
      puts "#{params}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edit_user_params
      params.require(:User).permit(:id, :firstName, :lastName, :email, :password)
    end


    def set_user
        if session[:user]
          @user = User.where(id: session[:user]["id"]).first
          @name = session[:user]["firstName"]
          @fullName = "#{session[:user]["firstName"]} #{session[:user]["lastName"]}"
          @avatar = @user.avatar
        else
          redirect_to login_url
        end
        
    end
end
