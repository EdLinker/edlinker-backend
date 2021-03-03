class Edlinker::API < Grape::API
  format :json
  get :status do
    { status: :ok }
  end
end