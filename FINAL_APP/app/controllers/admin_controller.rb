class AdminController < ApplicationController
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
end
