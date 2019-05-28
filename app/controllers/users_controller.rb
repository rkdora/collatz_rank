class UsersController < ApplicationController
  before_action :authorized, only: %i[new create]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, success: '新規登録に成功しました！'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def admin_user
    redirect_to(root_path, danger: "管理者以外は、その操作はできません") unless current_user.admin?
  end
end
