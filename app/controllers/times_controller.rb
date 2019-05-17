class TimesController < ApplicationController
  def index
    @code_times = CodeTime.all
  end

  def create
    @code = Code.find(params[:time][:code_id])
    File.open('test.rkt', 'w') do |text|
      text.puts(@code.content)
    end
    @code_time = CodeTime.new(code_id: @code.id, time: `racket test.rkt`)
    if @code_time.save
      redirect_to times_path, success: '計測に成功しました'
    else
      redirect_to times_path, danger: '計測に失敗しました'
    end
  end
end
