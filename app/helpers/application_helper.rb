module ApplicationHelper
  APP_NAME = 'Rails App'

  def page_title
    base_title = APP_NAME
    return base_title if @title.blank?
    "#{base_title} | #{@title}"
  end

  def flash_message(message, klass)
    content_tag(:div, class: "alert alert-#{klass}") do
      concat content_tag(:a, 'x', class: 'close', data: { dismiss: 'alert' })
      concat raw(message)
    end
  end
end
