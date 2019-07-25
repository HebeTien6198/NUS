class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :setUser

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
  
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
    locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def setUser
    @user = current_user
    if (@user != nil)
      if @user.avatar == nil
        @user.avatar = "assets/avatar.svg"
        @user.save
      end
      @avatar = @user.avatar
    end
  end
end
