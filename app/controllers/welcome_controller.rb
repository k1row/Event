class WelcomeController < ApplicationController
  def index
  	@events = Event.where('start_time > ?', Time.zone.now).order(:start_time)  # 未開催のイベントの取得
  end
end
