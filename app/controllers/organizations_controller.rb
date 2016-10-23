class OrganizationsController < ApplicationController
  
  before_action :logged_in_user

  
  def show 
   @organization = Organization.find(params[:id])
   @microposts = @organization.microposts
  end

end
