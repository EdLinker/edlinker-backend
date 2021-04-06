ActiveAdmin.register User do
  permit_params :first_name, :last_name, :patronymic, :phone_number, :email, :password, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :roles
    column :created_at
    actions
  end


  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    f.actions
  end
end
