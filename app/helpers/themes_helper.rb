module ThemesHelper
  def hide_code_time(code)
    Time.now - code.code_time.created_at < 60 * 60 * 24 * 7 #7日間
  end
end
