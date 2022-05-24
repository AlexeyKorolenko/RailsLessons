Rails.application.routes.draw do
  resources :questions
  # resources - позволяет создать множество маршрутов для одного контроллера
  # delete '/questions/:id', to: 'questions#destroy'
  # pages - название контроллера, который будет обрабатывать входящий запрос
  # index - метод который будет отвечать на запрос
  root 'pages#index'
end

