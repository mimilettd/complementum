Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: 'api', path: '/' do
    namespace 'v1' do
      get '/clients', to: 'clients#index'
    end
  end
end
