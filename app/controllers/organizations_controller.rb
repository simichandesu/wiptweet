class OrganizationsController < ApplicationController
  
  def show 
   @organization = Organization.find(params[:id])
   @microposts = @organization.microposts
  end

end
