class Edlinker::Tasks < Grape::API
  helpers do
    def declared_params
      declared(params, include_missing: false)
    end
  end
  params do
    requires :student_id
  end
  get ':student_id/tasks' do
    current_student = Student.find(params[:student_id])
    current_student.tasks.includes(:messages).map do |task|
      {
          author: task.messages.author,
          description: task.description,
          posted_at: task.created_at,
          body: task.messages.body,
          link: task.messages.link,
      }
    end
  end
end

