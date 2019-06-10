class TimesController < ApplicationController
  before_action :authorize, only: %i[create]

  def create
    @code = Code.find(params[:time][:code_id])
    File.open('test.rkt', 'w') do |text|
      text.puts(@code.content)
    end
    uptime = `uptime`
    uptime = uptime.split.last(3).first.to_f
    code_out_put = `racket test.rkt`
    cpu_time = code_out_put.split(' ')[2].to_i
    @code_time = CodeTime.new(code_id: @code.id,
                              time: cpu_time,
                              out_put: code_out_put,
                              uptime: uptime)
    if code_out_put != "" && @code_time.save
      redirect_to @code_time.code, success: '計測に成功しました'
    else
      redirect_to @code, danger: '計測に失敗しました'
    end
  end
end
