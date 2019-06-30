class LoginController < ApplicationController
  @message = "dd"
  def login
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
      #set session 
      session[:user] = dataUser.firstName 
      #go to home page
      redirect_to feed_feed_url    
    end
    
    
  end

  #--------take login input data from user-------------
  def user_params
    params.require(:User).permit(:email, :password)
  end
end
