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

  def logout
    reset_session
    redirect_to logout_url.to_s, notice: 'ログアウトしました'
  end

  private

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: Settings.auth0.client_id
    }

    URI::HTTPS.build(host: Settings.auth0.domain, path: '/v2/logout', query: request_params.to_query)
  end
end
