module ApplicationHelper

  def show_edit_links?(user)
    signed_in_as_admin? || signed_in_as?(user)
  end
end
