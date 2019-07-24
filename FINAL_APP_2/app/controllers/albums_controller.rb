class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  #-------------New Album-------------#
  def create
    puts params
    album = Album.new(params.require(:Album).permit(:title, :des, :sharing_mode))
    album.user = current_user
    #---create photos for album---#
    add_photos_for_album(album)
    #-----Save Album----#
    if album.save
      redirect_to profile_index_path
    else
      puts albums.errors.messages
    end
  end

  #-------GET Edit Album-----------#
  def edit
    @album = current_user.albums.find(params[:id]);
  end

  #--------Put Update Album----#
  def update
    @album = current_user.albums.find(params[:id]);
    @album.update(params.require(:Album).permit(:title, :des, :sharing_mode))
    #-----Add more photos for album--#
    add_photos_for_album(@album)
    #-----Save Album----#
    if @album.save
      redirect_to profile_index_path
    else
      puts albums.errors.messages
    end
  end

  #-----Delete Album------#
  def destroy
    @album = current_user.albums.find_by(id: params[:id]);
    if (@album != nil)
      @album.album_records.each do |record|
        #-Just delete photo has sharing mode = album-#
        if record.photo.is_album?
          record.photo.destroy
        end
      end
      #--Delete album--#
      if @album.destroy
        redirect_to profile_index_path
      else
        puts albums.errors.messages
      end
    end
  end

  def add_photos_for_album(album)
     #---Create Photo for Album----#
     params[:images].each do |image|
      photo = Photo.new
      photo.user = current_user
      photo.image = image
      photo.sharing_mode = "is_album"
      if photo.save
        #-Add photo to album-#
        album_record = AlbumRecord.create(photo: photo, album: album)
      else
        puts photo.errors.messages
      end
    end
  end

end
