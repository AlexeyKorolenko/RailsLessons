Rails.application.routes.draw do
  resources :users, only: %i[new create]

  # resources - позволяет создать множество маршрутов для одного контроллера
  resources :questions do
    resources :answers, except: %i[new show]
  end
  # pages - название контроллера, который будет обрабатывать входящий запрос
  # index - метод который будет отвечать на запрос
  root 'pages#index'
end

