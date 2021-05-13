class Edlinker::Groups < Grape::API
  helpers Edlinker::Helpers::User
  
  get 'groups' do
    current_user = authorized_user
    validate_teacher
    Group.joins(:auditoriums).where('auditoriums.user_id = ?', current_user.id).distinct.map do |group|
      {
          group_id: group.id,
          group_name: group.name,
          student_count: group.users.count,
          course_number: group.course_number,
          group_leader: {
            id: group.group_leader_id,
            first_name: group.group_leader_name,
            last_name: group.group_leader_surname
          }
       }
    end
  end
end
