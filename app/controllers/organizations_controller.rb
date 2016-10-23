class OrganizationsController < ApplicationController
  
  before_action :logged_in_user

  
  def show 
     
   @organization = Organization.find(params[:id])
   @microposts = @organization.microposts
   @microposts = @organization.microposts.order("id").page(params[:page]).per(5)
  end

end
