class Users::SessionsController < Devise::SessionsController
  layout :resolve_layout

  def new
    if current_user
      redirect_to arearestrita_url
    end
  end

  # POST /users/sign_in
  def create
    resource = warden.authenticate!(:scope => resource_name)
    sign_in(resource_name, resource)

    redirect_to(arearestrita_url)
  end

  private

  def resolve_layout
    #case action_name
    #when "exibir_post"
    #  "application"
    #else
    #  "arearestrita"
    #end
    "sessions"
  end

  protected

  def after_sign_in_path_for(resource)
    #request.env['omniauth.origin'] || stored_location_for(resource) || new_survey_path
    arearestrita_url
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url
  end

end
