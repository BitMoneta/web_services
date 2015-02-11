class Users::ConfirmationsController < Devise::ConfirmationsController
  protected

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource, :bypass => true)

    if session[:pending_registration]
      bitshares_account_path
    else
      profile_path
    end
  end
end
