class RegisterController < ApplicationController
  def register
    
  end
  
  def create
    @User = User.new(user_params);
    puts "#{@User}"
    @User.avatar = "/assets/default/avatar/avatar.svg"
    if @User.save
      #set session user
      session[:user] = @User
      #Get current time and add to last Login
      lastLogin = DateTime.current
      @User.lastLogin = lastLogin
      @User.save

      #check admin
      if (@User.admin == true)
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

  def user_params
    params.require(:User).permit(:firstName, :lastName, :email, :password)
  end

end
