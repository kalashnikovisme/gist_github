module ApplicationHelper
  include Concerns::AuthManagment

  def title(page_title = t('.title'), area = :default)
    if area != :default
      title_text = "#{page_title} | #{t(area)} | #{t('application.name')}"
    elsif page_title == :app_name
      title_text = t('application.name')
    else
      title_text = "#{page_title} | #{t('application.name')}"
    end
    content_for(:title) { title_text }
  end
end
