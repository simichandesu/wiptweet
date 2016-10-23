class StaticPagesController < ApplicationController

  before_action :logged_in_user  
  
  def home
    # @microposts = Micropost.all
    @microposts = Micropost.order("id").page(params[:page]).per(5)
  
    # GET /places
    # GET /places.json
    @organizations = Organization.all
    @hash = Gmaps4rails.build_markers(@organizations) do |organization, marker|
      marker.lat organization.latitude
      marker.lng organization.longitude
      marker.infowindow render_to_string(partial: "organizations/infowindow", locals: { organization: organization })
      # marker.json({title: organization.title})
    end
  end
end