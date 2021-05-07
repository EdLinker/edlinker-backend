class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  Telegram.bots_config = {
    default: ENV['TELEGRAM_TOKEN']
  }
  
  def start!(*)
    phone_number

  end

  def help!(*)
    respond_with :message, text: t('telegram_webhooks.help.content')
  end

  def mail!(*)

  end

  def phone_number(*)
    save_context :phone_number
    message = update['message']
    
    @contact = message.dig('contact', 'phone_number')
    puts @contact
    if @contact.nil?
      respond_with :message, text: t('telegram_webhooks.phone_number.prompt'), reply_markup: {
        keyboard: [[text: 'Share phone number', request_contact: true]],
        resize_keyboard: true,
        one_time_keyboard: true,
        selective: true
      }
    else
      @current_user = User.find_by(phone_number: @contact)
      puts @current_user
      @current_user.update_column(:telegram_data, from)


      respond_with :message, text: @current_user.telegram_data
      respond_with :message, text: t('telegram_webhooks.phone_number.saved')
    end
  end
end
