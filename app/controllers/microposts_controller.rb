class MicropostsController < ApplicationController

  @micropost = Micropost.order("id").page(params[:page]).per(5) 
  
  def create
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  private
  def micropost_params
    params.require(:micropost).permit(:title, :url, :summary)
  end
end
