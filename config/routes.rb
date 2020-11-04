Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :posts do
    collection do
      get '/new' => 'posts#new'
      post '/new' => 'posts#create'
    end
  end

  root to: 'posts#index'
end
