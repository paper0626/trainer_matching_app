Rails.application.routes.draw do
  get '/' => 'home#top'
  
  get 'trainers/signup' => 'trainers#new' #トレーナー新規登録
  get 'trainers/index' => 'trainers#index' #トレーナー一覧
  get 'trainers/:id' => 'trainers#show' #トレーナー詳細
  get 'trainers/:id/edit' => 'trainers#edit' #トレーナー情報編集
  
  post 'trainers/create' => 'trainers#create' #トレーナー新規登録（post）
  post 'trainers/:id/update' => 'trainers#update' #トレーナー情報編集（post）
  post 'trainers/:id/destroy' => 'trainers#destroy' #トレーナー削除（post）
  
  get 'users/signup' => 'users#new' #ユーザ新規登録
  get 'users/login' => 'users#login_form' #ユーザログイン画面
  get 'users/index' => 'users#index' #ユーザ一覧画面
  get 'users/:id' => 'users#show' #ユーザ詳細画面
  get 'users/:id/edit' => 'users#edit' #ユーザ情報編集
  
  post 'users/create' => 'users#create' #ユーザ新規登録（post）
  post 'users/:id/update' => 'users#update' #ユーザ情報編集（post）
  post 'users/:id/delete' => 'users#delete' #ユーザ削除（post）
  post 'users/login' => 'users#login' #ユーザログイン（post）
  post 'users/:id/destroy' => 'users#destroy' #ユーザ削除
  post 'users/:id/logout' => 'users#logout' #ユーザログアウト

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
