module ApplicationHelper

  def showing?(controller)
    controller_name == controller.to_s ? 'active' : ''
  end
end
