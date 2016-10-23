class StaticPagesController < ApplicationController
  
  
  def home
    # @microposts = Micropost.all
    @microposts = Micropost.order("id").page(params[:page]).per(5)
  end
end
