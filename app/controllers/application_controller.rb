class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'dataexpeditions', password: ENV.fetch('PASSWORD') if ENV['PASSWORD']

  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
