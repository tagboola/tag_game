class SessionsController < Devise::SessionsController
  
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_to do |format|  
      format.html { respond_with resource, :location => after_sign_in_path_for(resource) }  
      format.json { render :json => {:success => true, :authentication_token => resource.authentication_token, :user => resource} }  
    end
  end
  
  #TODO: Override session destroy to return json
  
  # def create
    # resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    # sign_in_and_redirect(resource_name, resource)
  # end
#  
  # def sign_in_and_redirect(resource_or_scope, resource=nil)
    # scope = Devise::Mapping.find_scope!(resource_or_scope)
    # resource ||= resource_or_scope
    # sign_in(scope, resource) unless warden.user(scope) == resource
    # respond_to do |format|
      # format.html { respond_with resource, :location => after_sign_in_path_for(resource) }  
      # format.json { render :json => {:success => true, :authentication_token => resource.authentication_token, :user => resource} }  
    # end  
  # end
#  
  # def failure
    # respond_to do |format|  
      # format.html { respond_with resource }
      # format.json { render :json => {:success => false, :errors => ["Login failed."]}}
    # end
  # end
  
end