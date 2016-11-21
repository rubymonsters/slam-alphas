class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in_as?(user)
    signed_in? && current_user == user
  end

  def disallow_unless(user)
    redirect_to root_url unless signed_in_as?(user)
  end
end
