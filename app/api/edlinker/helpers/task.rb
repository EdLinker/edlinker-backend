module Edlinker::Helpers::Task
  extend Grape::API::Helpers
  params :task_params do
    requires :title, type: String
    requires :subject_id, type: Integer
    requires :page, type: Integer
    requires :auditorium_id, type: Integer
    optional :description, type: String
    optional :status, type: Integer
    optional :url, type: Hash
  end
end