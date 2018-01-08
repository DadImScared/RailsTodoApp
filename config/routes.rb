Rails.application.routes.draw do

  # get 'todo_lists/index'
  #
  # get 'todo_lists/show'
  #
  # get 'todo_lists/new'
  #
  # get 'todo_lists/edit'
  #
  # get 'todo_lists/create'
  #
  # get 'todo_lists/update'
  #
  # get 'todo_lists/destroy'

  authenticate :user do
    resources :todo_lists

    resources :todo_lists do
      resources :items
    end
  end



  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
