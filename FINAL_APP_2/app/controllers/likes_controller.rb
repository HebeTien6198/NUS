class LikesController < ApplicationController
  before_action :set_like_model

  def create
    like = Like.new
    like.user = current_user
    like.likeable_type = params["likeable_type"]
    like.likeable_id = params["likeable_id"]
    
    if like.save
      render json: {num_of_likes: @like_model.find(like.likeable_id).likes.size}
    else
      puts like.errors.messages
    end
  end

  def destroy
    like = Like.where("user_id = ? AND likeable_type = ? AND likeable_id = ?",
       current_user.id, params["likeable_type"], params["likeable_id"]).first

    
    if like.destroy
      render json: {num_of_likes: @like_model.find(like.likeable_id).likes.size}
    else
      puts like.errors.messages
    end
  end

  def like_params
    params.require(:Like).permit(:user_id, :likeable_type, :likeable_id)
  end

  def set_like_model
    @like_model = params["likeable_type"] == "Photo" ? Photo.all : Album.all
  end
end
