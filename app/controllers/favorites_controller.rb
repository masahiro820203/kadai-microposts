class FavoritesController < ApplicationController
 before_action :require_user_logged_in
  
  def show
    @user = User.find(params[:id])
    @clips = @user.favorites.page(params[:id])
  end
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.clip(micropost)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unclip(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url
  end
end
