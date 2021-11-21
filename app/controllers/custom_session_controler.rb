class CustomSessionsController < Devise::SessionsController
  ## for rails 5+, use before_action, after_action
  before_action :before_login, :only => :create
  after_action :after_login, :only => :create

  def before_login
  end

  def after_login
    set_user
  end

  private

  def set_user
    cookies[:user_id] = current_user.id || 'guest'
  end
end
