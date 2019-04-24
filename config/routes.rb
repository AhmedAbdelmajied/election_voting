Rails.application.routes.draw do
   root to: 'votes#new'
   resource :votes , only: [:new, :create]
end
