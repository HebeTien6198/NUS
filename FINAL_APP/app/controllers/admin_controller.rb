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
        @user = session[:user]
        @name = @user["firstName"]
        editUser = User.new(edit_user_params)
        user = User.where(id: editUser.id).first
        user.email = editUser.email
        user.password = editUser.password
        user.firstName = editUser.firstName
        user.lastName = editUser.lastName

        if (user.save)
            redirect_to admin_url
        end
    end





    #-------------------------Manage Photo-----------------------#
    def managePhoto
        @photos = Photo.all
    end











    private
    # Use callbacks to share common setup or constraints between actions.
    def set_target_user
      @targetUser = User.where(id: params[:format]).first
      @targetAvatar = @targetUser.avatar
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
          redirect_to login_login_url
        end
        
    end
end
