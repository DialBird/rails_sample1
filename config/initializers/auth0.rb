Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    Settings.auth0.client_id,
    Rails.application.credentials.auth0[:secret],
    Settings.auth0.domain,
    callback_path: '/auth/oauth2/callback',
    authorize_params: {
      scope:  'openid profile email'
    }
  )
end
