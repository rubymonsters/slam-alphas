module ApplicationHelper

  def show_edit_links?(user)
    signed_in_as_admin? || signed_in_as?(user)
  end

  def profile_nav_active_class(name)
    if @subnav_active == name
      'active'
    end
  end
end
