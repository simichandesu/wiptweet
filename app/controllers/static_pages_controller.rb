class StaticPagesController < ApplicationController
  before_action :logged_in_user  
  
  def home
    # @microposts = Micropost.all
    @microposts = Micropost.order("id").page(params[:page]).per(5)
  
    # GET /places
    # GET /places.json
    @organizations = Organization.all
    @hash = Gmaps4rails.build_markers(@organizations) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow render_to_string(partial: "places/infowindow", locals: { place: place })
      # marker.json({title: place.title})
  end
  
  end
end