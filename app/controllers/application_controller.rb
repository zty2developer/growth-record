class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :get_new_feedback

  protected
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

	def get_new_feedback
		@feedback = Feedback.new
	end
end
