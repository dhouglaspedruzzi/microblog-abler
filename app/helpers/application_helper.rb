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

end
