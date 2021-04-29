class TelegramWebhooksController <  Telegram::Bot::UpdatesController
  Telegram.bots_config = {
      default: ENV["TELEGRAM_TOKEN"]
  }
  def start!(*)
    respond_with :message, text: t('telegram_webhooks.start.content')
  end

  def help!(*)
    respond_with :message, text: t('telegram_webhooks.help.content')
  end
end