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
 # 顧客用URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 会員用
    root to: 'public/homes#top'
    get '/about' => 'public/homes#about', as: 'about'

    get '/customers/my_page' => 'public/customers#show', as: 'my_page'
        get '/customers/information/edit' => 'public/customers#edit', as: 'edit_customer'
    patch '/customers/information' => 'public/customers#update', as: 'customer'
    get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'
    
        delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all'
        
        post '/orders/confirm' => 'public/orders#confirm', as: 'confirm'
        get '/orders/thanks' => 'public/orders#thanks', as: 'thanks'
        get '/search' => 'public/items#search', as: 'search'
        
        scope module: :public do
          resources :items, only: [:index, :show]
          resources :cart_items, only: [:index, :update, :destroy, :create]
          resources :orders, only: [:new, :create, :index, :show]
          resources :addresses, only: [:index, :edit, :create, :update, :destroy]
        end
        
      # 管理者用
      namespace :admin do
        root to: 'homes#top'    
        get 'customer_orders' => 'homes#customer_orders', as: 'customer_orders'
        
        resources :items, only: [:index, :new, :create, :show, :edit, :update]
        
        resources :genres, only: [:index, :create, :edit, :update]

        resources :customers, except: [:new, :create, :destroy]
              
        resources :orders, only: [:show, :update]

        patch '/admin/order_details/:id' => 'order_details#update', as: 'order_detail'
      end
    end      