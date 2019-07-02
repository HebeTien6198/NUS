class ProfileController < ApplicationController

  #-----------------------GET--------------------------#
  def profile
    if session[:user]
      @name = session[:user]["firstName"]
      @fullName = "#{session[:user]["firstName"]} #{session[:user]["lastName"]}"
    else
      redirect_to login_login_url
    end
  end

  def editProfile
    if session[:user]
      @name = session[:user]["firstName"]
    else
      redirect_to login_login_url
    end
  end

  #-------------------------POST--------------------------#
  #--------Log out-------------------#
  def logOut
    redirect_to login_login_url
  end
  #-------edit Basic profile---------#
  def editBasicProfile
    edit = User.new(user_basic_params);
    user = User.where(email: session[:user]["email"]).first
    puts "--------------------------#{user.email}-----------------------------"
    user.firstName = edit.firstName
    user.lastName = edit.lastName
    user.email = edit.email

    if user.save
      puts "---------------------Successfull-----------------------------"
      redirect_to profile_url
    else
      @message = user.errors.messages
    end

  end

  #-------------CHange Password------------#
  def editPassword
    puts "------------------password-------------------------"
    user = User.where(email: session[:user]["email"]).first
    basic = user_password
    #------Check Password----------------
    if user.password != basic["currentPassword"]
      redirect_to editProfile_url
    else
      #------Save new password
      user.password = basic["newPassword"]
      if (user.save)
        #------If save password sucessful---#
        redirect_to profile_url
      else
        #-----if failed-------
        redirect_to editProfile_url
      end
    end

  end

  
  #--------take login input data from user-------------
  def user_basic_params
    params.require(:User).permit(:firstName, :lastName, :email)
  end

  def user_password
    return params.permit(:currentPassword, :newPassword)
  end
end
