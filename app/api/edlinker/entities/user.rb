class Edlinker::Entities::User < Grape::Entity
  #insert_before Grape::Middleware
  expose :id
  expose :first_name
  expose :last_name
  expose :patronymic
  expose :phone_number
  expose :email
  expose :role, using: Edlinker::Entities::Role
end
