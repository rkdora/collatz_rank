module ThemesHelper
  def hide_code_time(code)
    Time.now - code.code_time.created_at < 60 * 60 * 24 * 3 #3日間
  end
end
