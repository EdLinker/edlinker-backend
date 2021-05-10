ActiveAdmin.register Group do
  permit_params :name, :tuition_form, :course_number, :group_leader_id, :group_leader_name, :group_leader_surname, :auditorium_id, :teacher_id
end
