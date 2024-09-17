Rails.application.routes.draw do

  root to: "public/homes#top"
  get 'about' => 'public/homes#about'

  scope module: :public do
    #会員
    resources :users, path: 'users/mypage', only: [:show]
    resources :users, path: 'users/information', only: [:edit, :update], as: :users_information
    get 'users/unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw', as: 'withdraw'
    #投稿
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    #作品、作品にレビューをネスト
    resources :works, only: [:index, :show] do
      resources :reviews, only: [:index, :new, :create]
      collection do
        get 'letter/:letter', to: 'works#index', as: 'letter'
      end
    end
    #スポット、スポットにレビューをネスト
    resources :spots, only: [:index, :show] do
      resources :reviews, only: [:index, :new, :create]
    end
    #コメント
   
    #レビュー
    resources :reviews, only: [:show, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :works, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :spots, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :reviews, only: [:index, :show, :destroy]
  end

  # 顧客用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# ゲストログイン用
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
