module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div,
                    message,
                    class: "alert #{bootstrap_class_for(msg_type)}") do
          content_tag(:div, class: 'container') { concat message }
        end)
    end
    nil
  end
end
