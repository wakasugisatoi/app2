Rails.application.routes.draw do 
 root to: 'homes#top'   #homeページを作成
 devise_for :users   #deviceを使用する際にURLとしてusersを含む
 get "users" => redirect("/users/sign_up") #アクセスがusersの場合に自動的にuserrs/sign_upに移動する
 get 'homes/about' => 'homes#about',as: 'about'
 
 resources :post_images, only: [:new, :create, :index, :show, :destroy]do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
 end
 
 resources :users, only:[:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
