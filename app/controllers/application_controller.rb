# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  add_flash_types :success, :info, :warning, :danger

  def authorize
    redirect_to login_path, danger: 'ログインしてください' unless logged_in?
  end

  def authorized
    redirect_to root_path, warning: 'その操作はできません' if logged_in?
  end

  def admin_user
    redirect_to(root_path, danger: "管理者以外は、その操作はできません") unless current_user.admin?
  end
end
