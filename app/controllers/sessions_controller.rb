class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      log_in user
      redirect_to user
    else
      redirect_to login_path, danger: '名前かパスワードが間違っています'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
