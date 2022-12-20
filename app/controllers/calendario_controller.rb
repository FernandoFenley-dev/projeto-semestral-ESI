class CalendarioController < ApplicationController
  def show
    @data = params[:data] ? Date.parse(params[:data]) : Date.today
  end
end
