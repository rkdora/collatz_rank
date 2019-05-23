class ThemesController < ApplicationController
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
  end

  private

  def theme_params
    params.require(:theme).permit(:title, body)
  end
end
