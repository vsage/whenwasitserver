Rails.application.routes.draw do
  resources :questions
  root 'static_pages#home'

  match '/list_questions', to: 'questions#list', via: [:options]
  get '/list_questions' => 'questions#list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
