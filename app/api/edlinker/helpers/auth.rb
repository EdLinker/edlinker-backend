module Edlinker::Helpers::Auth
  extend Grape::API::Helpers
  params :person_params do
    requires :email, type: String
    requires :password, type: String
    optional :phone_number, type: String
    optional :first_name, type: String
    optional :last_name, type: String
    optional :patronymic, type: String
  end
end
