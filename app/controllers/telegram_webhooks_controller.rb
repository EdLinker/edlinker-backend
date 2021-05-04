class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  Telegram.bots_config = {
    default: ENV['TELEGRAM_TOKEN']
  }
  @current_user = User.find_by(phone_number: @contact)
  def start!(*)
    phone_number
    # respond_with :message, text: "#{chat['id']}"
  end

  def help!(*)
    respond_with :message, text: t('telegram_webhooks.help.content')
  end

  def phone_number(*)
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
      respond_with :message, text: t('telegram_webhooks.phone_number.saved')
    end
  end
end
