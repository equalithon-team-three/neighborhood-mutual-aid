Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], scope: 'email,profile'
end

# Rails.application.config.middleware.insert_after ActiveRecord::Migration::CheckPending, ActionDispatch::Cookies
# Rails.application.config.middleware.insert_after ActionDispatch::Cookies, ActionDispatch::Session::CookieStore
