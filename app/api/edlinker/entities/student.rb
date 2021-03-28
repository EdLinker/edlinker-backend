class Edlinker::Entities::Student < Grape::Entity
  expose :id
  expose :first_name
  expose :last_name
  expose :patronymic
  expose :phone_number
  expose :email
end