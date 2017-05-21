module UsersHelper
  def user_alpha_or_recommended(user)
    if user.alpha?
      return 'SLAM ALPHA'
    else
      return "empfohlen von #{user.recommended_by_alpha}"
    end
  end

  def admin_user_public?(current_user, user)
    if current_user && current_user.admin? && user.public
      true
    else
      false
    end
  end
end
