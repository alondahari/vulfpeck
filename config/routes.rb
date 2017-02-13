Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'entries#new', as: 'new_entry'
  post '', controller: 'entries', action: 'create'
  post '/upvote/:id', to: 'entries#upvote'
  get '/leaderboard', to: 'entries#index', as: 'leaderboard'
end
