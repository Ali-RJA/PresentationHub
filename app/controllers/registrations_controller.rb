class RegistrationsController < Devise::RegistrationsController
  # Override default delete account behavior to set the account active flag to false instead of deleting the row.
  # This alteration was made in order to not require presentations and feedbacks made by the user to be removed due to
  # foreign key restraints.
  def destroy
    # Unset the active flag in the DB for the current user
    resource.deactivate

    # Sign out of the current user to prevent issues with inactive user
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_navigational_format?

    # Redirect to the app root, which will bring you to the login page due to not being authenticated
    redirect_to root_path
  end
end
