class Users::RegistrationsController < Devise::RegistrationsController
  # def create
  #   super
  #   # redirect_to new_user_registration_url
  #   redirect_to new_user_session_url
  # end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    # set_flash_message(:notice, :signed_up_but_unconfirmed)
    super
  end
end
