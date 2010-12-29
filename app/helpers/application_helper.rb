module ApplicationHelper

  def active?(controller)
    {:class => controller_name == controller.to_s && 'active'}
  end
end
