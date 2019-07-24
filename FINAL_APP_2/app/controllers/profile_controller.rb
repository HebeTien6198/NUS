class ProfileController < ApplicationController
  before_action :authenticate_user!
  def index
    @photos = current_user.photos
    @albums = current_user.albums
    @following_records = current_user.follower
    @follower_records = current_user.following
  end
end
