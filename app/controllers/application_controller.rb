class ApplicationController < ActionController::Base
  include SessionsHelper

  add_flash_types :success, :info, :warning, :danger

  def authorize
    unless logged_in?
      redirect_to login_path, danger: 'ログインしてください'
    end
  end
end
