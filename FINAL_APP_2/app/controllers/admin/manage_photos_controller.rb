class Admin::ManagePhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def edit
    @photo = Photo.find(param[:id])
  end

    #--GET Edit Photo--#
    def edit
      @photo = Photo.find(params[:id])
    end
  
    #--PUT Update Photo--#
    def update
      photo = Photo.find(params[:id])
      photo.update(photo_params)
      if (photo.save)
        redirect_to request.referer
      else
        puts photo.errors.messages
      end
    end
  
    #--DELELE Photo--#
    def destroy
      photo = Photo.find(params[:id])
      if photo.destroy
        redirect_to admin_manage_users_url
      else
        puts photo.errors.messages
      end
    end
  
  #-----------Params------------------#
    def photo_params
      return params.require(:photo).permit(:id, :title, :sharing_mode, :des)
    end

end
