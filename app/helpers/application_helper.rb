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

  def menu_item(name = nil, path = '#', *args, &block)
    path = name || path if block_given?
    options = args.extract_options!
    content_tag :li, class: is_active?(path, options) do
      name, path = path, options if block_given?
      link_to name, path, options, &block
    end
  end

  def is_active?(path, options = {})
    'active' if uri_state(path, options).in? [:active, :chosen]
  end

  def uri_state(uri, options = {})
    root_url = request.host_with_port + '/'
    root = uri == '/' || uri == root_url
    request_uri = if uri.start_with? root_url
                    request.url
                  else
                    request.path
                  end
    if !options[:method].nil? || !options["data-method"].nil?
      :inactive
    elsif uri == request_uri || (options[:root] && (request_uri == '/') || (request_uri == root_url))
      :active
    else
      if request_uri.start_with?(uri) and not(root)
        :chosen
      else
        :inactive
      end
    end
  end
end
