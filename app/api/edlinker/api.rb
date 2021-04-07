class Edlinker::API < Grape::API
  format :json
  prefix :api

  get :status do
    (:ok)
  end

  mount Edlinker::Groups
  mount Edlinker::Auth
  mount Edlinker::Tasks
end
