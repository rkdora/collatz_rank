class TimesController < ApplicationController
  def index
    @code_times = CodeTime.all.order(:time)
  end

  def create
    @code = Code.find(params[:time][:code_id])
    File.open('test.rkt', 'w') do |text|
      text.puts(@code.content)
    end
    code_out_put = `racket test.rkt`
    cpu_time = code_out_put.split(' ')[2].to_i
    @code_time = CodeTime.new(code_id: @code.id,
                              time: cpu_time,
                              out_put: code_out_put)
    if @code_time.save
      redirect_to root_path, success: '計測に成功しました'
    else
      redirect_to root_path, danger: '計測に失敗しました'
    end
  end
end
