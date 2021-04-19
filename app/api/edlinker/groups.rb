class Edlinker::Groups < Grape::API
  namespace :users do
    get ':user_id/groups' do
      current_user = User.find(params[:user_id])
      current_user.groups.includes(:users, :subject).map do |group|
        {
            auditorium_id: group.auditorium.id,
            group_id: group.id,
            group_name: group.name,
            student_count: group.users.count,
            subject: group.subject.name,
            course_number: group.course_number,
            group_leader: group.group_leader.id
        }
      end
    end
  end
end
