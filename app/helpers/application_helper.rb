require 'russian_cases'

module ApplicationHelper
  include Concerns::AuthManagment
  include RussianCases

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

  def page_title(action, model_name)
    t("helpers.actions.#{action}") + ' ' + genitive(model_name)
  end

  def form_after_save?
    referrer = Rails.application.routes.recognize_path request.referrer
    referrer[:controller] == params[:controller] && referrer[:action] == params[:action]
  end

  def object_updated_less_minute_ago?(object)
    ((DateTime.now - object.model.updated_at.to_datetime) * 24 * 60).to_i < 1
  end
end
