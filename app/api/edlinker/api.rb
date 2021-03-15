class Edlinker::API < Grape::API
  format :json
  prefix :api

  get :status do
    (:ok)
  end

  mount Edlinker::Groups

end