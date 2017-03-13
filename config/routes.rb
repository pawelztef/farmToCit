Rails.application.routes.draw do
  resources :categories
  get 'sessions/new'

  get 'password_resets/new'

  get 'password_resets/edit'

	get 'home', to: 'static_pages#home'
	get 'help', to: 'static_pages#help'
	get	'about', to: 'static_pages#about'
	get 'signup', to: 'users#new'
	get 'edituser', to: 'users#edit'
	get	'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	get 'catalog', to: 'products#index'
	get  'products/filter' => 'products#filter', :as => 'product_filter'
	get 'paypal', to: 'static_pages#paypal'
	get 'orders', to: 'orders#index'

	resources :users
	resources :account_activations,	only: [:edit]
	resources	:password_resets, only:	[:new, :create,	:edit, :update]

	mount Shoppe::Engine => "/shoppe"
	get "product/:permalink", to: "products#show", as: "product"
	post "product/:permalink", to: "products#buy"
	get "basket", to: "orders#show"
	delete "basket", to: "orders#destroy"
	
	match "checkout", to: "orders#checkout", as: "checkout", via: [:get, :patch]
	match "checkout/pay", to: "orders#payment", as: "checkout_payment", via: [:get, :post]
	match "checkout/confirm", to: "orders#confirmation", as: "checkout_confirmation", via: [:get, :post]

	root 'static_pages#home'
	
end

