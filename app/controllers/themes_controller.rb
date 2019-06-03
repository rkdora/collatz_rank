class ThemesController < ApplicationController
  before_action :authorize, only: %i[new create edit update destory]
  before_action :admin_user, only: %i[edit update destroy]

  def index
    @themes = Theme.all

    @users = User.all
    h = Hash.new
    @users.each do |user|
      h.store(user.name, 0)
    end

    Theme.all.each do |theme|
      rank = Code.joins(:code_time).eager_load(:code_time).where(theme_id: theme.id).order(:time)
      rank.each_with_index do |code, i|
        if i < 10 #10位以下はポイントなし
          h.store(code.user.name, h[code.user.name] + (100 / (i + 1)))
        end
      end
    end

    @points = h.sort_by{ | k, v | v }.reverse
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
    @codes = Code.joins(:code_time).eager_load(:code_time).where(theme_id: @theme.id).order(:time)
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    if @theme.update(theme_params)
      redirect_to @theme, success: "Theme updated"
    else
      render :edit
    end
  end

  def destroy
    Theme.find(params[:id]).destroy
    redirect_to root_path, success: "Theme deleted"
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :body)
  end
end
