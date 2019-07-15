class RegisterController < ApplicationController
  def register
    
  end
  
  def create
    puts "----------------------------dit me may-------------------------------------"

    @User = User.new(user_params);
    puts "#{@User}"
    @User.save
  end

  def user_params
    params.require(:User).permit(:firstName, :lastName, :email, :password)
  end

end
