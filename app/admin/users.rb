ActiveAdmin.register User do
  permit_params :first_name, :last_name, :patronymic, :phone_number, :email, :password, role_ids: [], avatars: []

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :patronymic
    column :phone_number
    column :email
    column :roles
    column :created_at
    actions
  end


  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :patronymic
      f.input :phone_number
      f.input :email
      f.input :password
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    f.actions
  end
end

