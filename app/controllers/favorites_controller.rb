class FavoritesController < ApplicationController
  before_action :set_micropost
    
  def create
    current_user.favorites.create(micropost: @micropost)
  end

  def destroy
    current_user.favorites.where(micropost: @micropost).destroy_all
    render 'create'
  end
  
  private
  def set_micropost
      @micropost = Micropost.find(params[:id])
  end
end
