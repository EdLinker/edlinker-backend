module Edlinker::Helpers::Message
  extend Grape::API::Helpers
  params :message_params do
    requires :message, type: Hash do
      requires :task_id, type: Integer
      optional :body, type: String
      optional :status, type: Integer
      optional :url, type: Array
    end
    optional :student_id, type: Integer
  end
end
