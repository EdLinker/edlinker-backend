ActiveAdmin.register Task do
  permit_params :title, :auditorium_id, :description, :status, :url
end