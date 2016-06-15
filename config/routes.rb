Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :studies, path: 'etudes'
  resources :partners, path: 'partenaires'
  resources :tinymce_uploads
  get '*id', to: 'pages#show', constraints: { id: /(demarche)/}, as: :page

  namespace :dashboard do
    resources :studies, path: 'etudes' do
      post :duplicate, on: :member
      post :submit_for_review, on: :member
    end
    resource :profile
  end

  namespace :admin do
    resources :users
    resources :studies do
      get :to_review, on: :collection
      get :accepted, on: :collection
      get :edit_carousel_attributes, on: :member
      post :put_in_carousel, on: :member
      post :accept, on: :member
      post :reject, on: :member
    end
    resources :categories
    resources :partners
    resources :pages, only: [:edit, :update]
  end

  root to: 'homepage#home'
end
