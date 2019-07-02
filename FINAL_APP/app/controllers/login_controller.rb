class LoginController < ApplicationController
  def login
    if session[:user]
      redirect_to feed_url
    end
  end

  def validateLogin
    #Get input from user
    guest = User.new(user_params)
    puts guest.email
    puts guest.password
    
    #Check in the database
    dataUser = User.where(email: guest.email).first
    
    #Check whether email exits or not
    if (dataUser === nil)
      @message = "Wrong email!"
    #Check whether password correct or not
    elsif (dataUser.password != guest.password)
      @message = "Wrong password!"
    #If every thing is OK
    else
      #set session user
      session[:user] = dataUser
      #check admin
      if (dataUser.admin == true)
        #set session admin
        session[:admin] = true
        #go to admin page
        redirect_to admin_path
      else
      #go to home page
      redirect_to feed_url 
      end   
    end
    
    
  end

  #--------take login input data from user-------------
  def user_params
    return params.require(:User).permit(:email, :password)
  end
end
