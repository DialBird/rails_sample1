Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'CYVj8R33M6O4D2cnd1ueDB6oCC1Id1yP',
    Rails.application.credentials.auth0[:secret],
    'dialbird.au.auth0.com',
    callback_path: '/auth/oauth2/callback',
    authorize_params: {
      scope:  'openid profile email'
    }
  )
end
