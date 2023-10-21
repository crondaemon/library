class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  def current_institute
    @current_institute ||= current_user.institute if user_signed_in?
  end
  helper_method :current_institute
end
