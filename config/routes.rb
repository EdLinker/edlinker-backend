Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Edlinker::API => '/'

  telegram_webhook TelegramWebhooksController
end
