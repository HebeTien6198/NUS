class AlbumRecordsController < ApplicationController
  def destroy
    album_record = AlbumRecord.find(params[:id])
    if album_record != nil and album_record.album.user == current_user
      if album_record.destroy
        redirect_to request.referrer, notice: "You're being redirected"
      else
        puts album_record.errors.message
      end
    end  
  end
end
