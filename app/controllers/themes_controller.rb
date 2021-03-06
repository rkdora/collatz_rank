class ThemesController < ApplicationController
  before_action :authorize, only: %i[new create edit update destory]
  before_action :admin_user, only: %i[destroy]

  def index
    @themes = []

    @users = User.all
    h = Hash.new
    @users.each do |user|
      h.store(user.name, 0)
    end

    Theme.all.each do |theme|
      rank = Code.joins(:code_time).eager_load(:code_time).where(theme_id: theme.id).order(:time)
      new_code = Code.joins(:code_time).eager_load(:code_time).where(theme_id: theme.id).order(:created_at).last

      if rank.first.nil?
        @themes.push([theme])
      elsif (Time.now - rank.first.created_at) < 24.hours && (Time.now - new_code.created_at) < 24.hours
        @themes.push([theme, rank.first.user, rank.count, "code", "top"])
      elsif (Time.now - rank.first.created_at) < 24.hours
        @themes.push([theme, rank.first.user, rank.count, "top"])
      elsif (Time.now - new_code.created_at) < 24.hours
        @themes.push([theme, rank.first.user, rank.count, "code"])
      else
        @themes.push([theme, rank.first.user, rank.count])
      end

      rank.each_with_index do |code, i|
        if i < 10 #10位以下はポイントなし
          h.store(code.user.name, h[code.user.name] + (100 / (i + 1)))
        end
      end
    end

    @themes.reverse!

    @points = h.sort_by{ | k, v | v }.reverse
  end

  def new
    @theme = Theme.new
  end
  
  def create
    image_error = false
    @theme = Theme.new(theme_params)
    if @theme.save
      params[:theme][:image]&.each do |i|
        image = ThemeImage.new(theme_id: @theme.id, image: i)
        unless image.save
          image_error = true
          break
        end
      end
      if image_error
        flash.now[:danger] = "画像のアップロードに失敗しました。ファイル形式、ファイルサイズ、ファイル名を確認してください。"
        render :edit
      else
        redirect_to @theme, success: '問題を作成しました'
      end
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
    image_error = false
    @theme = Theme.find(params[:id])
    if @theme.update(theme_params)
      params[:theme][:checked_images]&.each do |i|
        ThemeImage.find(i).destroy
      end
      params[:theme][:image]&.each do |i|
        image = ThemeImage.new(theme_id: @theme.id, image: i)
        unless image.save
          image_error = true
          break
        end
      end
      if image_error
        flash.now[:danger] = "画像のアップロードに失敗しました。ファイル形式、ファイルサイズ、ファイル名を確認してください。"
        render :edit
      else
        redirect_to @theme, success: '問題を更新しました'
      end
    else
      render :edit
    end
  end

  def destroy
    Theme.find(params[:id]).destroy
    redirect_to root_path, success: "問題を削除しました"
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :body)
  end
end
