module Edlinker::Helpers::Auth
  extend Grape::API::Helpers
  params :person_params do
    requires :email, type: String
    requires :password, type: String
  end
end
