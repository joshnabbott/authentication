module ApplicationHelper
  def navigation
    links = current_user ? [
      content_tag(:li, link_to_unless_current('My account', account_path)),
      content_tag(:li, link_to_unless_current('Log out', user_session_path, :method => :delete, :confirm => 'Are you sure you want to log out?'))
    ] : [
      content_tag(:li, link_to_unless_current('Register', new_account_path)),
      content_tag(:li, link_to_unless_current('Log in', new_user_session_path)),
    ]
    content_tag(:ul, links)
  end

  def render_flash_messages
    flash.each do |key,value|
      return content_tag(:p, value, :class => key.to_s)
    end
  end
end
