class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :signed_in_as_admin?, :signed_in_as?


  def signed_in_as?(user)
    signed_in? && current_user == user
  end

  def signed_in_as_admin?
    signed_in? && current_user.admin?
  end

  def disallow_unless(user)
    redirect_to root_url unless signed_in_as?(user)
  end

  def disallow_unless_admin
    redirect_to root_url unless signed_in_as_admin?
  end

  def disallow_unless_admin_or_user(user)
    redirect_to root_url unless signed_in_as_admin? || signed_in_as?(user)
  end

  def visible_users
    if signed_in?
      current_user.visible_for_signed_in_users
    else
     User.where(public: true).sort_by { |x| x.transliterate_last_name }
   end
  end
end
