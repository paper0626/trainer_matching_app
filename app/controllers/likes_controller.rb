class LikesController < ApplicationController
  before_action :authenticate_user #ログインしていないユーザに対するアクセス制限

  def index
    @likes = Like.where(user_id: @current_user.id)
  end
  
  def like
    @like = Like.new(user_id: @current_user.id, trainer_id: params[:trainer_id])
    @like.save
    redirect_to("/trainers/#{params[:trainer_id]}")
  end
  
  def unlike
    @like = Like.find_by(user_id: @current_user.id, trainer_id: params[:trainer_id])
    @like.destroy
    redirect_to("/trainers/#{params[:trainer_id]}")
  end
end
