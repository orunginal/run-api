class SessionsController < Devise::SessionsController
  def create
    # TODO: generate a new token ?
    respond_to do |format|
      format.json do
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        data = {
          data: {
            id: self.resource.id,
            token: self.resource.authentication_token,
            email: self.resource.email,
            is_admin: self.resource.is_admin
          }
        }
        render json: data, status: 201
      end
    end
  end
end