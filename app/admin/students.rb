ActiveAdmin.register Student do
  permit_params :first_name, :last_name, :patronymic, :phone_number, :email, :group_id
end
