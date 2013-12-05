ButcherShop::Application.routes.draw do
  resources :users, :except => [:new, :edit, :index, :create]

  resources :users, :except => [:new, :edit] do
    resources :favorites, :only => [:index, :create]
  end

  resources :animals, :except => [:new, :edit] do
    resources :primal_cuts, :only => [:index, :create]
    resources :cuts,        :only => [:index, :create]
  end

  resources :primal_cuts, :only => [:show, :update, :destroy] do
    resources :cuts, :only => [:index, :create]
  end

  resources :cuts, :only => [:show, :update, :destroy]

  resources :favorites, except => [:new, :edit]
end
