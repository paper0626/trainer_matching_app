Rails.application.routes.draw do
  # ホーム
  get '/' => 'home#top'
  
  # トレーナー関係
  get 'trainers/signup' => 'trainers#new' #トレーナー新規登録
  get 'trainers/index' => 'trainers#index' #トレーナー一覧
  get 'trainers/:id' => 'trainers#show' #トレーナー詳細
  get 'trainers/:id/edit' => 'trainers#edit' #トレーナー情報編集
  
  post 'trainers/create' => 'trainers#create' #トレーナー新規登録
  post 'trainers/:id/update' => 'trainers#update' #トレーナー情報編集
  post 'trainers/:id/destroy' => 'trainers#destroy' #トレーナー削除
  
  # いいね関係
  get 'likes/index' => 'likes#index' #いいね一覧
  post 'trainers/:trainer_id/like' => 'likes#like' #いいね
  post 'trainers/:trainer_id/unlike' => 'likes#unlike' #いいね取り消し
  
  # ユーザー関係
  get 'users/signup' => 'users#new' #ユーザ新規登録
  get 'users/login' => 'users#login_form' #ユーザログイン画面
  get 'users/index' => 'users#index' #ユーザ一覧画面
  get 'users/:id' => 'users#show' #ユーザ詳細画面
  get 'users/:id/edit' => 'users#edit' #ユーザ情報編集
  
  post 'users/create' => 'users#create' #ユーザ新規登録
  post 'users/:id/update' => 'users#update' #ユーザ情報編集
  post 'users/login' => 'users#login' #ユーザログイン
  post 'users/:id/destroy' => 'users#destroy' #ユーザ削除
  post 'users/logout' => 'users#logout' #ユーザログアウト

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
