class FollowController < ApplicationController
  def create
    puts params
    follow_record = Follow.new
    follow_record.follower = current_user
    follow_record.following_id = params[:following_id]
    if follow_record.save
      
    else
      puts following_record.errors.messages
    end
  end

  def destroy
    puts "destroy"
    puts params
    puts current_user.follower.first.following_id
    puts params[:following_id]
    following_record = current_user.follower.where(following_id: params[:following_id]).first
    if following_record.destroy
      
    else
      puts following_record.errors.messages
    end
  end
end
