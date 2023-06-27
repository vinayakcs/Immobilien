# == Route Map
#
#             Prefix Verb     URI Pattern                        Controller#Action
#               root POST|GET /                                  agents#index
#             signup GET|POST /signup(.:format)                  sessions#omniauth_signup
#            privacy GET      /privacy(.:format)                 system#privacy_policy
#              terms GET      /terms(.:format)                   system#terms_of_service
#           feedback GET|POST /feedback(.:format)                system#feedback
# locationsuggestion GET|POST /locationsuggestion(.:format)      location#search
#                    POST|GET /auth/:provider/callback(.:format) sessions#omniauth_create
#       auth_failure POST|GET /auth/failure(.:format)            sessions#omniauth_failure
#            signout POST|GET /signout(.:format)                 sessions#destroy
#            profile POST|GET /profile(.:format)                 user#profile
#        edit_client GET      /clients/:id/edit(.:format)        clients#edit
#             client PATCH    /clients/:id(.:format)             clients#update
#                    PUT      /clients/:id(.:format)             clients#update
#         edit_agent GET      /agents/:id/edit(.:format)         agents#edit
#              agent PATCH    /agents/:id(.:format)              agents#update
#                    PUT      /agents/:id(.:format)              agents#update
#

Immobilien::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  scope "(:locale)", :locale => /#{I18n.available_locales.join("|")}/ do
    root :to => "agents#index", via: [:post, :get]
    match "/info", :to => 'system#index', :as => :info, via: [:get,:post]
    match "/signup", :to => 'sessions#omniauth_signup',:as => :signup, via: [:get,:post]
    match "/privacy", :to => 'system#privacy_policy', :as => :privacy, via: [:get]
    match "/terms", :to => 'system#terms_of_service', :as => :terms, via: [:get]
    mount Ckeditor::Engine => '/ckeditor'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    match "/createmessage", :to => 'messages#create', :as=>:createmessage, via:[:get,:post]
    match "/createreview", :to => 'reviews#create', :as => :createreview, via:[:get,:post]
    match "/showreview", :to => 'reviews#show', :as=>:showreview, via:[:get,:post]
    match "/showmessage", :to => 'messages#show', :as=>:showmessage, via:[:get,:post]
    match "/feedback", :to => 'system#feedback', :as=>:feedback, via: [:get,:post]
    match "/locationsuggestion", :to => 'location#search', :as => :locationsuggestion, via: [:get,:post]
    match '/auth/:provider/callback', :to => 'sessions#omniauth_create',  via: [:post, :get]
    match '/auth/failure', :to => 'sessions#omniauth_failure',  via: [:post, :get]
    match "/signout" , :to => 'sessions#destroy', :as => :signout, via: [:post, :get]
    match "/profile", :to => 'user#profile', :as=>:profile, via: [:post,:get]
    match "/message", :to => 'messages#show', :as => :message, via: [:post,:get]
    resources :reviews, only: [:index], via: [:post,:get]
    resources :clients, only: [:edit,:update,:show], via: [:post,:get]
    resources :agents, only: [:edit,:update,:show,:index], via: [:post,:get]
  end  


end
