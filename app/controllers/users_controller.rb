class UsersController < ApplicationController
  
  
  def show # 追加
  @user = User.find(params[:id])
  @microposts = Micropost.all
  @microposts = Micropost.order("id").page(params[:page]).per(5)
  
  @organizations = Organization.all
  @hash = Gmaps4rails.build_markers(@organizations) do |organization, marker|
      marker.lat organization.latitude
      marker.lng organization.longitude
      marker.infowindow render_to_string(partial: "organizations/infowindow", locals: { organization: organization })
      # marker.json({title: organization.title})
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the WIPTweet!!"
      redirect_to@user #redirect_to user_path(@user)と同じ
    else
      render 'new'
    end
  end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
