class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  add_flash_types :success, :info, :warning, :danger

  helper_method :current_user, :user_signed_in?

  def authenticate_user!
    return if user_signed_in?

    redirect_to root_path
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= user_from_session
  end

  private

  def user_from_session
    return unless session[:userinfo]

    User.find_by(id: session[:userinfo][0], uid: session[:userinfo][1])
  end
end
