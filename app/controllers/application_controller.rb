class ApplicationController < ActionController::Base
  before_filter :mailer_set_url_options

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def cities
    render json: CS.cities(params[:state], :us).to_json
  end
  
end
