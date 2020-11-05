Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :posts
  namespace :admins do
    get '/' => "admins#posts"
  end
  root to: 'posts#index'
end
