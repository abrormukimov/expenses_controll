module ApplicationHelper
  def copyright_generator
    DevcampViewTool::Renderer.copyright 'Abror Mukimov', 'All rights reserved'
  end

  def login_helper(style = '')
    if current_user
      link_to 'Logout', destroy_user_session_path, class: style, method: :delete
    else
      (link_to 'Login', new_user_session_path, class: style) + ' '.html_safe +
        (link_to 'Register', new_user_registration_path, class: style)
    end
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: expenses_path,
        title: 'Expenses'
      },
      {
        url: extExpenses_path,
        title: 'External Expenses'
      },
      {
        url: groups_path,
        title: 'Groups'
      },
      {
        url: edit_user_registration_path(current_user),
        title: 'My Account'
      }
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''
    a_tag = ''
    nav_items.each do |item|
      a_tag = "<a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a>"
      nav_links << "<#{tag_type}>#{a_tag}</#{tag_type}>"
      a_tag = ''
    end

    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end
end
