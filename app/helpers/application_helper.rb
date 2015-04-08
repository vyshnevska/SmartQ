module ApplicationHelper
  def notifications(msgs, type = :success)
    msgs.collect{ |name, msg| msg if name == type.to_s}.join(' ') if msgs[type.to_s]
  end

  def navigation_menu
    content_tag :ul, class: "nav navbar-nav" do
      if user_signed_in?
        concat(user_navigation_links)
        concat(admin_navigation_links) if current_user.admin?
      else
        concat(login_navigation_links)
      end
    end
  end

  def admin_navigation_links(links = "")
    links += content_tag(:li) do
      link_to I18n.t('views.nav.categories'), admin_categories_path
    end
    links += content_tag(:li) do
      link_to I18n.t('views.nav.users'), users_path
    end
    links += content_tag(:li) do
      link_to I18n.t('views.nav.summary_report'), statistics_path
    end
    links.html_safe
  end

  def user_navigation_links(links = "")
    links += content_tag(:li) do
      link_to I18n.t('views.nav.assessment'), user_assessments_path
    end
    links += content_tag(:li) do
      link_to current_user.role.capitalize, '#'
    end
    links += content_tag(:li) do
      link_to I18n.t('views.nav.profile'), user_path(current_user)
    end
    links += content_tag(:li) do
      link_to I18n.t('views.nav.logout'), destroy_user_session_path, :method=>'delete'
    end
    links.html_safe
  end

  def login_navigation_links(links = "")
    links += content_tag(:li) do
      link_to I18n.t('views.nav.sign_in'), new_user_session_path
    end
    links += content_tag(:li) do
      link_to I18n.t('views.nav.sign_up'), new_user_registration_path
    end
    links.html_safe
  end
end
