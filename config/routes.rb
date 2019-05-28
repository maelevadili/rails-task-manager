Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'tasks',    to: 'tasks#create'
  get 'tasks',     to: 'tasks#index'

  get 'tasks/new', to: 'tasks#new', as: :new_task
  # tjrs mettre le "new" avt le "show", sinon erreur
  # va considerer que "new" est un id...

  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  # pour afficher un formulaire d'edition
  get 'tasks/:id/mark_as_done', to: 'tasks#mark_as_done', as: :mark_task_as_done
  get 'tasks/:id',      to: 'tasks#show', as: :task

  patch 'tasks/:id',    to: 'tasks#update'
  # pour enregistrer la modif en base
  patch 'tasks/:id',    to: 'tasks#mark_as_done'

  delete 'tasks/:id',   to: 'tasks#destroy'
end
