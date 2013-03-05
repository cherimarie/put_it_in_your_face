module ApplicationHelper

  def user_sign_in
    return if params[:controller] == "devise/registrations" ||
              params[:controller] == "devise/sessions"

    if user_signed_in?
      "Hi there, #{current_user.email}!"
    else
      link_to "Sign up", new_user_registration_path
      link_to "Sign in", new_user_session_path
    end
  end
end
