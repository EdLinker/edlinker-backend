class Edlinker::Entities::User < Grape::Entity
  expose :id
  expose :first_name
  expose :last_name
  expose :patronymic
  expose :phone_number
  expose :email
  expose :roles, using: Edlinker::Entities::Role
end
