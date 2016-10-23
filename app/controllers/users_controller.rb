class UsersController < ApplicationController
  
  
  def show # 追加
   @user = User.find(params[:id])
   @microposts = Micropost.all
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end