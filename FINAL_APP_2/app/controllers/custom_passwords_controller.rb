class CustomPasswordsController < ApplicationController
  def update
    if current_user.valid_password?(params[:user]["current_password"]) and current_user.update(user_params)
    else
      puts current_user.errors.messages
    end
  end

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end
