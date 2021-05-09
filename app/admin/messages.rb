ActiveAdmin.register Message do
  permit_params :task_id, :body, :url, :status, :author_type, :author_id
end
