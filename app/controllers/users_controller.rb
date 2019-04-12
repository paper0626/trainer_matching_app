class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:edit, :update, :destroy]} #ログインしていないユーザに対するアクセス制限
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]} #ログインしているユーザに対するアクセス制限
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]} #他のユーザ情報の編集・削除などに対するアクセス制限
  
  
  # ユーザー一覧表示
  def index
    @users = User.all
  end
  
  # ユーザー詳細画面
  def show
    @user = User.find_by(id: params[:id])
  end
  
  # ユーザー新規登録画面（new）
  def new
    @user = User.new
  end
  
  # ユーザー新規登録（create）
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      flash[:notice] = 'ユーザーとして新規登録しました'
      session[:user_id] = @user.id #ログインする
      redirect_to("/users/#{@user.id}")
    else
      render('users/new')
    end
  end
  
  # ユーザー情報編集画面
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  # ユーザー情報編集（update）
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    
    if @user.save
      flash[:notice] = '登録情報を編集しました'
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  # ユーザ情報削除（destroy）
  def destroy
    # ユーザ削除
    @user = User.find_by(id: params[:id])
    @user.destroy
    
    # トレーナーとして登録していれば、その情報を削除
    @trainer = Trainer.find_by(user_id: @user.id)
    @trainer.destroy
    
    session[:user_id] = nil # ログアウト
    flash[:notice] = '登録情報を削除しました'
    redirect_to('/')
  end
  
  # ユーザーログイン画面（login_form）
  def login_form
    @user = User.new
  end
  
  # ユーザーログイン（login）
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:notice] = 'ログインしました'
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      @password = params[:password]
      render('users/login_form')
    end
  end
  
  # ユーザーログアウト
  def logout
    flash[:notice] = 'ログアウトしました'
    session[:user_id] = nil
    redirect_to('/users/login')
  end
  
  # 他のユーザ情報を編集or削除できないようにする
  def ensure_correct_user
    if params[:id] != @current_user.id
      flash[:notice] = 'アクセスできません'
    end
  end
end