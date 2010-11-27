class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_authentification
  before_filter :disable_user_creation

  def require_authentification
    authenticate_user! unless devise_controller?
  end

  def disable_user_creation
    render_404 if controller_name == "registrations" and ( params[:action] == "create" or  params[:action] == "new" or params[:action] == 'index' )
  end

  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end
