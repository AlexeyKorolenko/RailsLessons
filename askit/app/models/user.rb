class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true # обязательный ввод email + уникальность email
  validates :name, presence: true # обязательный ввод имени
end
