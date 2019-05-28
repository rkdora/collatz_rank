class ThemesController < ApplicationController
  before_action :authorize, only: %i[new create destory]
  before_action :admin_user, only: :destroy

  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
  end
  
  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to @theme, success: 'テーマを作成しました'
    else
      render :new
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @codes = Code.where(theme_id: @theme.id).left_joins(:code_time).order(:time)
  end

  def destroy
    Theme.find(params[:id]).destroy
    flash[:success] = "Theme deleted"
    redirect_to root_path
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :body)
  end
end
