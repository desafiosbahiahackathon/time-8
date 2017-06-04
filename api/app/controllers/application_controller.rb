include ActionController::HttpAuthentication::Token::ControllerMethods

class ApplicationController < ActionController::API
  def require_login
    authenticate_token || render_unauthorized('Access denied')
  end

  def current_user
    @current_user ||= authenticate_token
  end

  protected

  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :render_unauthorized
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, options|
      if (user = User.find_by(token: token))
        ActiveSupport::SecurityUtils.secure_compare(
            ::Digest::SHA1.hexdigest(token),
            ::Digest::SHA1.hexdigest(user.token))
        user
      end
    end
  end
end
