class Edlinker::Posts < Grape::API
  helpers Edlinker::Helpers::Posts
  desc 'create a new post'
  params do
    requires :title, type: String
    requires :body, type: String
    requires :published_at, type: String
  end
  post do
    Post.create!(declared_params)
  end
end