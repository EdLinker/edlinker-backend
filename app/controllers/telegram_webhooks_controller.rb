class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  before_action :current_user
  Telegram.bots_config = {
    default: ENV['TELEGRAM_TOKEN']
  }
  
  def start!(*)
    phone_number
  end

  def help!(*)
    respond_with :message, text: t('telegram_webhooks.help.content')
  end

  def main_inline_menu!
    subjects = []
    subject_buttons = []

    @current_user.tasks.each do |task|
      subjects << task.subject.name
    end

    subjects.each do |subject|
      subject_buttons << {text: subject, callback_data: 'subject'}
    end

    respond_with :message, text: 'Choose your subject', reply_markup: {
      inline_keyboard: [
        subject_buttons
      ]
    }
  end

  def choose_task
    tasks = []
    task_buttons = []
    @current_user.tasks.each_with_index do |task, index|
      tasks << task.title
      task_buttons << {text: tasks[index], callback_data: 'task'}
    end
    respond_with :message, text: 'Choose your task', reply_markup: {
      inline_keyboard: [
        task_buttons,
        [
          { text: 'Back', callback_data: 'back_to_subjects'}
        ]
      ]
    }
  end

  def change_last_task_status!
    respond_with :message, text: 'Choose your progress', reply_markup: {
      inline_keyboard: [
        [
          {text: 'ToDo', callback_data: 'todo'},
          {text: 'In progress', callback_data: 'in_progress'},
          {text: 'Done', callback_data: 'done'},
          {text: 'Problems', callback_data: 'problems'}
        ]
      ]
    }
  end

  def callback_query(data)
    #p @current_user
    task = @current_user.tasks[-1]
    case data
    when 'todo'
      task.update_column(:status, 0)
      p task
      answer_callback_query 'Status changed to ToDo'
    when 'in_progress'
      task.update_column(:status, 1)
      p task
      answer_callback_query 'Status changed to In Progress'
    when 'done'
      task.update_column(:status, 2)
      p task
      answer_callback_query 'Status changed to Done'
    when 'subject'
      edit_message :message, {}
    when 'back_to_subjects'
      edit_message main_inline_menu!
    end

  end

  def phone_number
    save_context :phone_number
    message = update['message']
    @contact = message.dig('contact', 'phone_number')
    if @contact.nil?
      respond_with :message, text: t('telegram_webhooks.phone_number.prompt'), reply_markup: {
        keyboard: [[text: 'Share phone number', request_contact: true]],
        resize_keyboard: true,
        one_time_keyboard: true,
        selective: true
      }
    else
      update_tg_data
      respond_with :message, text: t('telegram_webhooks.phone_number.saved')
    end
  end

  def current_user
    @current_user = User.where("telegram_data->>'user_id' = ?", from['id'].to_s).first
  end

  def update_tg_data
    @current_user = User.find_by(phone_number: @contact)
    puts "This is #{@current_user.first_name}"
    tg_data = {user_id: from['id'], chat_id: chat['id']}
    @current_user.update_column(:telegram_data, tg_data)
  end
end
