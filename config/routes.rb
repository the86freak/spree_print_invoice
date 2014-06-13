Spree::Core::Engine.routes.append do

  namespace :admin do
  	resources :print_invoice_settings
    resources :orders do
      member do
        get :show
      end
    end
  end

end
