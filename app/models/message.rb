class Message < ApplicationRecord
  after_create :send_task
  belongs_to :task
  # belongs_to :author, polymorphic: true

  #private
  def send_task
    p user
    text = "#{body} #{url.first if url}"
    #Telegram.bot.send_message(chat_id: task.user.telegram_data['chat_id'], text: text)
  end
end
