class TrainersController < ApplicationController
  # トレーナー一覧表示
  def index
    @trainers = Trainer.all
  end
  
  # トレーナー新規登録画面
  def new
    @trainer = Trainer.new
  end
  
  # トレーナー詳細画面
  def show
    @trainer = Trainer.find_by(id: params[:id])
  end
  
  # トレーナー新規登録（create）
  def create
    @trainer = Trainer.new(name: params[:name], email: params[:email], password: params[:password])
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
    @trainer.name = params[:name]
    @trainer.email = params[:email]
    @trainer.password = params[:password]
    
    if @trainer.save
      flash[:notice] = '登録情報を編集しました'
      redirect_to("/trainers/#{@trainer.id}")
    else
      render("trainers/edit")
    end
  end
end
