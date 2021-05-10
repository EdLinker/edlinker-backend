ActiveAdmin.register Auditorium do
  permit_params :name, :user_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :user_id, as: :select, collection: User.with_role(:teacher)
    end
    f.actions
  end
end
