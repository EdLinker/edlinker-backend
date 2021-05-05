module Edlinker::Helpers::Task
  extend Grape::API::Helpers
  params :task_params do
    requires :task, type: Hash do
      requires :title, type: String
      requires :subject_id, type: Integer
      optional :description, type: String
      optional :status, type: Integer
      optional :url, type: Hash
    end
    requires :page, type: Integer
  end
end
