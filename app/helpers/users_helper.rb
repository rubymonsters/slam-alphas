module UsersHelper
  def user_alpha_or_recommended(user)
    if user.alpha?
      return 'SLAM ALPHA'
    else
      return "empfohlen von #{user.recommended_by_alpha}"
    end
  end
end
