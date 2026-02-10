class ApplicationController < ActionController::Base
  include Pundit::Authorization

  helper_method :current_user

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  rescue_from Pundit::NotAuthorizedError, with: :handle_not_authorized

  private

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = User.find_by(id: session[:user_id])
  end

  def require_authentication
    return if current_user

    redirect_to new_session_path, alert: "Please log in to continue."
  end

  def handle_not_authorized
    redirect_to root_path, alert: "You are not authorized to do that."
  end
end
