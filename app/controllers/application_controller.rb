class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  add_flash_types :success, :info, :warning, :danger

  helper_method :current_user, :user_signed_in?

  unless Rails.env.development?
    rescue_from Exception,                      with: :render_500
    rescue_from ActiveRecord::RecordNotFound,   with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
  end

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

    User.find_by(id: session[:userinfo][0], email: session[:userinfo][1])
  end

  def render_404
    if request.format.to_sym == :json
      render json: { error: '404 error' }, status: :not_found
    else
      render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
    end
  end

  def render_500(err = nil)
    logger.debug(<<~LOG)
      500 Error message starts
      #{err.class} (#{err.message}):
      #{Rails.backtrace_cleaner.clean(err.backtrace).join("\n").indent(1)}
    LOG
    if request.format.to_sym == :json
      render json: { error: '500 error' }, status: :internal_server_error
    else
      render file: Rails.root.join('public/500.html'), status: 500, layout: false, content_type: 'text/html'
    end
  end
end
