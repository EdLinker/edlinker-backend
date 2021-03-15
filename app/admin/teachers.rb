ActiveAdmin.register Teacher do
  permit_params :first_name, :last_name, :patronymic, :phone_number, :email
end
