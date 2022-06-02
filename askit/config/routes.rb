Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
  # resources - позволяет создать множество маршрутов для одного контроллера
  resources :questions do
    resources :answers, except: %i[new show]
  end
  # pages - название контроллера, который будет обрабатывать входящий запрос
  # index - метод который будет отвечать на запрос
  root 'pages#index'
end
