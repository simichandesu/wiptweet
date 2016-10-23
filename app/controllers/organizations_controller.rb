class OrganizationsController < ApplicationController
  before_action :logged_in_user  

  def index
   @organization = Organization.find(params[:id])
   @microposts = @organization.microposts
   @microposts = @organization.microposts.order("id").page(params[:page]).per(5)

   @hash = Gmaps4rails.build_markers(@organization) do |organization, marker|
      marker.lat organization.latitude
      marker.lng organization.longitude
      # marker.infowindow organization.name
      marker.infowindow render_to_string(partial: "organizations/infowindow", locals: { organization: organization })
  end
  end

# GET /organizations/1
  # GET /organizations/1.json
  
  def show
  @organization = Organization.find(params[:id])
   @microposts = @organization.microposts
   @microposts = @organization.microposts.order("id").page(params[:page]).per(5)
    @hash = Gmaps4rails.build_markers(@organization) do |organization, marker|
      marker.lat organization.latitude
      marker.lng organization.longitude
      # marker.infowindow organization.name
      marker.infowindow render_to_string(partial: "organizations/infowindow", locals: { organization: organization })
    end
  end

  # GET /organizations/new
  def new
    @organization = Organization.new(address: "東京",latitude: 35.6894875,longitude: 139.69170639999993)
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :address, :latitude, :longitude)
    end
end

