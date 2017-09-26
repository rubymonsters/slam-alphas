module UsersHelper
  def user_alpha_or_recommended(user)
    if user.alpha?
      return '<span class="alphaheart" title="SLAM ALPHA">SLAM ALPHA</span>'.html_safe
    elsif user.recommended_by_alpha.present?
      return "empfohlen von <br> #{user.recommended_by_alpha}".html_safe
    else
      return ""
    end
  end

  def admin_user_public?(current_user, user)
    if current_user && current_user.admin? && user.public
      true
    else
      false
    end
  end

  def user_embedded_video(user)
    width = 650
    height = 500
    if user.video_link && user.video_link.match('vimeo')
      "<iframe src=\"https://player.vimeo.com/video/#{vimeo_id(user.video_link)}?color=ffffff&byline=0&portrait=0\" width=\"#{width}\" height=\"#{height}\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>".html_safe
    elsif user.video_link && user.video_link.match('youtube')
      "<iframe src=\"https://www.youtube-nocookie.com/embed/#{youtube_id(user.video_link)}?rel=0?ecver=2\" width=\"#{width}\" height=\"#{height}\" frameborder=\"0\" allowfullscreen></iframe>".html_safe
    else
      ""
    end
  end

  def vimeo_id(url)
    match = url.match(/https?:\/\/(?:[\w]+\.)*vimeo\.com(?:[\/\w]*\/?)?\/(?<id>[0-9]+)[^\s]*/)
    match[:id] if match.present?
  end

  def youtube_id(url)
    match = url.match(/youtube.com.*(?:\/|v=)([^&$]+)/)
    match[1] if match.present?
  end

  def user_map_nav_class(user_country, countrystring)
    classes = []
    classes.push countrystring
    if user_country == countrystring
      classes.push "active"
    end
    classes
  end
end
