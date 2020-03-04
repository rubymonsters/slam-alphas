Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "info@slamalphas.org"
  config.cookie_domain = ".slamalphas.org"
  config.secure_cookie = true
  config.rotate_csrf_on_sign_in = true
end
