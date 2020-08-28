class ApplicationController < ActionController::API
    include Pundit
    include ActionController::MimeResponds
    respond_to :json
 
    rescue_from Pundit::NotAuthorizedError, with: :render_401
    %w[401 404 500 403].each do |status_code|
        define_method("render_#{status_code}") do |exception|
          send_error(status_code)
        end
    end

    def send_error(message = nil, status = :internal_server_error)
        render json: message, status: status
    end
end
