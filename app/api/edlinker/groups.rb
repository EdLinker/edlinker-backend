class Edlinker::Groups < Grape::API
  namespace :users do
    get ':user_id/groups' do
      current_user = User.find_by(id: params[:user_id])
      error!('User not found') unless current_user

      current_user.groups.includes(:subject).map do |group|
        {
            auditorium_id: group.auditorium.id,
            group_id: group.id,
            group_name: group.name,
            student_count: group.users.count,
            subject: group.subject&.name,
            course_number: group.course_number,
            group_leader: group.group_leader_id
        }
      end
    end
  end
end
