class Admin::ManageUsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @edit_user = User.find(params[:id]) 
  end

  def update
    @edit_user = User.find(params[:id])

    #---Update password if not null---#
    if params[:user]["password"] != ""
      if @edit_user.update(params.require(:user).permit(:password))
      else
        puts @edit_user.errors.message
      end
    end

    #--Update other attribute---#
    if @edit_user.update(user_params)
      redirect_to request.referer
    else
      puts @edit_user.errors.message
    end

  end

  def delete
    @delete_user = User.find(params[:id])
    if @delete_user.destroy
      redirect_to admin_manage_users_url
    else
      puts @delete_user.errors.messages
    end
  end

  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
