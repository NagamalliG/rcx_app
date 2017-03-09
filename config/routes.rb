Rails.application.routes.draw do
  root :to => 'home#index'
  get 'rest/getTierSvc'

  get 'rest/getProgramsSvc/' => 'rest#getProgramsSvc', :defaults => { :format => 'json'},  :as => :get_programs_svc
  get 'rest/getLevelsSvc/' => 'rest#getLevelsSvc', :defaults => { :format => 'json'},  :as => :get_levels_svc
  # get 'rest/getProgramsFromMeanApp'
  # root 'rest#getdata'
  mount ShopifyApp::Engine, at: '/'
  post '/getPrograms' => 'home#getPrograms'
  get '/getTiers' => 'home#getTiers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
