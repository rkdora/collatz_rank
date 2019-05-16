class ApplicationController < ActionController::Base
  include SessionsHelper

  def authorize
    unless logged_in?
      redirect_to login_path
    end
  end
end
