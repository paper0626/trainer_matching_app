class TrainersController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]} #ログインしていないユーザに対するアクセス制限
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]} #他のユーザ情報の編集・削除などに対するアクセス制限
  
  # トレーナー一覧表示
  def index
    @trainers = Trainer.page(params[:page]).per(10)
  end
  
  # トレーナー詳細画面
  def show
    @trainer = Trainer.find_by(id: params[:id])
  end
  
  # トレーナー新規登録画面
  def new
    @trainer = Trainer.new
  end
  
  # トレーナー新規登録（create）
  def create
    @trainer = Trainer.new(user_id: @current_user.id, message: params[:message])
    if @trainer.save
      flash[:notice] = 'トレーナーとして新規登録しました'
      redirect_to("/trainers/#{@trainer.id}")
    else
      render('trainers/new')
    end
  end
  
  # トレーナー情報編集画面
  def edit
    @trainer = Trainer.find_by(id: params[:id])
  end
  
  # トレーナー情報編集（update）
  def update
    @trainer = Trainer.find_by(id: params[:id])
    @trainer.message = params[:message]
    
    if @trainer.save
      flash[:notice] = '登録情報を編集しました'
      redirect_to("/trainers/#{@trainer.id}")
    else
      render("trainers/edit")
    end
  end
  
  # トレーナー情報削除（destroy）
  def destroy
    @trainer = Trainer.find_by(id: params[:id])
    @likes = Like.where(trainer_id: @trainer.id)

    # お気に入り情報削除
    @likes.each do |like|
      like.destroy
    end
    
    # トレーナー情報削除
    @trainer.destroy
    
    flash[:notice] = '登録情報を削除しました'
    redirect_to("/users/#{@trainer.user_id}")
  end
  
  # 他のユーザ情報を編集or削除できないようにする
  def ensure_correct_user
    @trainer = Trainer.find_by(id: params[:id])
    if @current_user.id != @trainer.user_id #今ログインしているユーザ　!= 編集しようとしているトレーナーのユーザーid
      flash[:notice] = 'アクセスできません'
    end
  end
end
