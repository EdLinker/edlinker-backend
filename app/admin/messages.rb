ActiveAdmin.register Message do
  permit_params :task_id, :body, :link, :author_type, :author_id
end
