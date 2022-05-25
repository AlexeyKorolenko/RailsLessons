Rails.application.routes.draw do
  # resources - позволяет создать множество маршрутов для одного контроллера
  resources :questions do
    resources :answers, only: %i[create destroy update edit]
  end
  # pages - название контроллера, который будет обрабатывать входящий запрос
  # index - метод который будет отвечать на запрос
  root 'pages#index'
end

