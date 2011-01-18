module ApplicationHelper

  def active?(controller)
    controller_name == controller.to_s && 'active'
  end
end
