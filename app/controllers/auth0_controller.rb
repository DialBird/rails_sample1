class Auth0Controller < ApplicationController
  skip_before_action :authenticate_user!

  def callback
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:userinfo] = [user.id, user.uid]
    redirect_to '/dashboard', notice: 'ログインしました'
  end

  def failure
    @error_msg = request.params['message']
  end
end
