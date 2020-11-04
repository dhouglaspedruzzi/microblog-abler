module ApplicationHelper

  def user_avatar_img user
    user.avatar.attached? && user.avatar || 'default/default-user-img.jpg'
  end

  def user_url user
    "p/#{ user.url }"
  end

  def link_to_user user, options={}
    link_to user_url(user), profile_index_path(user.url), options
  end

  def date_formater date
    date.strftime('%d/%m/%Y %H:%M')
  end

  def global_notifications type, message = ''
    classes = 'green-text' if type == :success
    classes = 'red-text' if type == :error

    message = message.gsub("\n", '<br/>').to_s.html_safe if type == :error

    content_tag(:div, class: classes, role: :alert) do
      message
    end
  end

end
