Rails.application.routes.draw do
  get '/' => 'home#top'
  
  get 'trainers/signup' => 'trainers#new' #トレーナー新規登録
  get 'trainers/index' => 'trainers#index' #トレーナー一覧
  get 'trainers/:id/' => 'trainers#show' #トレーナー詳細
  
  post 'trainers/create' => 'trainers#create' #トレーナー新規登録（post）
  
  get 'users/signup' => 'users#new' #ユーザ新規登録
  get 'users/login' => 'users#login_form' #ユーザログイン画面

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
