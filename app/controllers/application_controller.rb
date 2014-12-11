class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  # protected
  # def not_logged_in!
  #   if person_signed_in?
  #     super
  #   else
  #     redirect_to '/sign_in', :notice => 'if you want to add a notice'
  #   end
  # end

  private
  def after_sign_out_path_for(person)
  	new_person_session_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do
      |u| u.permit(:email,
                   :first_name,
                   :last_name,
                   :gender,
                   :password,
                   :password_confirmation,
                   :remember_me)
    end
    devise_parameter_sanitizer.for(:account_update) do
      |u| u.permit(:email,
                   :first_name,
                   :last_name,
                   :gender,
                   :birthdate,
                   :address,
                   :city,
                   :state,
                   :zip_code,
                   :password,
                   :password_confirmation,
                   :current_password)
    end
  end
end
