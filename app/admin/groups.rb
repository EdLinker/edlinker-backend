ActiveAdmin.register Group do
  permit_params :name, :tuition_form, :course_number, :group_leader_id
end
