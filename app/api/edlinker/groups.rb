class Edlinker::Groups < Grape::API
  helpers Edlinker::Helpers::User
  
  get 'groups' do
    current_user = authorized_user
    validate_teacher
    current_user.auditorium.groups.includes(:subject).map do |group|
      {
          group_id: group.id,
          auditorium_id: group.auditorium.id,
          group_name: group.name,
          student_count: group.users.count,
          subject: group.subject&.name,
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
