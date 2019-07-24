class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  #--Upload new Photo--#
  def create
    photo = Photo.new(upload_photo_params)
    photo.user = current_user

    if (photo.save)
      redirect_to profile_index_url
    else
      puts photo.errors.messages
    end
  end

  #--GET Edit Photo--#
  def edit
    @photo = Photo.find(params[:id])
  end

  #--PUT Update Photo--#
  def update
    puts "ccccccccccc"
    photo = Photo.find(params[:id])
    photo.update(photo_params)
    if (photo.save)
      redirect_to profile_index_url
    else
      puts photo.errors.messages
    end
  end

  #--DELELE Photo--#
  def destroy
    photo = Photo.find(params[:id])
    if photo.destroy
      redirect_to profile_index_url
    else
      puts photo.errors.messages
    end
  end

#-----------Params------------------#
  def photo_params
    return params.require(:Photo).permit(:id, :title, :sharing_mode, :des)
  end

  def upload_photo_params
    return params.require(:Photo).permit(:title, :sharing_mode, :image, :des)
  end
end
