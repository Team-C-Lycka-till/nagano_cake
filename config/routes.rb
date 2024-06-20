Rails.application.routes.draw do
  #namespace :admin do
    #get 'orders/show'
  #end
  #namespace :admin do
    #get 'customers/index'
    #get 'customers/show'
    #get 'customers/edit'
  #end
  #namespace :admin do
    #get 'genres/index'
    #get 'genres/edit'
  #end
  #namespace :admin do
    #get 'items/new'
    #get 'items/index'
    #get 'items/show'
    #get 'items/edit'
  #end
  #namespace :admin do
    #get 'homes/top'
  #end
  #namespace :public do
    #get 'addresses/index'
    #get 'addresses/edit'
  #end
  #namespace :public do
   # get 'orders/new'
    #get 'orders/index'
    #get 'orders/show'
    #get 'orders/confirm'
  #end
  #namespace :public do
    #get 'cart_items/index'
  #end
  #namespace :public do
    #get 'items/index'
    #get 'items/show'
  #end
  #namespace :public do
    #get 'customers/show'
    #get 'customers/edit'
    #get 'customers/unsubscribe'
  #end
  #namespace :public do
    #get 'homes/top'
    #get 'homes/about'
 # end
  devise_for :admins, skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
    root to:  "public/homes#top"
    get '/about' => 'public/homes#about', as: 'about'

    get '/customers/my_page' => 'public/customers#show', as: 'my_page'
    get '/customers/information/edit' => 'public/customers#edit', as: 'information/edit'
    patch '/customers/information/update' => 'public/customers#update', as: 'information'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy], controller: 'public/addresses' 
      namespace :admin do
    root to: 'homes#top'
    
  end
  
  #寺田↓
  
end
  #寺田↑
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

