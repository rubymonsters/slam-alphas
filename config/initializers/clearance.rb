Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "info@slamalphas.org"
  config.cookie_domain = ".slamalphas.org" if Rails.env.production?
  config.cookie_expiration = lambda { |cookies| 1.year.from_now.utc }
  config.cookie_name = "slam_alphas_remember_token"
  config.secure_cookie = true if Rails.env.production?
  config.routes = false
  config.redirect_url = "/"
  config.rotate_csrf_on_sign_in = true
end
