ActiveAdmin.register Task do
  permit_params :title, :user_id, :subject_id, :auditorium_id, :description, :status, :url, :number

  form do |f|
    f.inputs do
      f.input :subject_id, as: :select, collection: Subject.all
      f.input :user_id, as: :select, collection: User.all
      f.input :auditorium_id, as: :select, collection: Auditorium.all
      f.input :title
      f.input :number
      f.input :status, as: :select, collection: Task.statuses.keys
      f.input :url
      f.input :description
    end
    f.actions
  end
end