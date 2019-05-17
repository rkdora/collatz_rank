class TimesController < ApplicationController
  def index
    @code_times = CodeTime.all
  end
end
