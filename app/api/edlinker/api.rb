class Edlinker::API < Grape::API
  format :json
  prefix :api
  mount Edlinker::Posts
end