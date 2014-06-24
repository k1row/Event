class EventsController < ApplicationController
	before_action :authenticate

	def new
		p current_user
		@event = current_user.created_events.build
	end

	def create
		@event = current_user.created_events.build(event_params)
		if @event.save
			redirect_to @event, notice: '作成しました'
		else
			render :new
		end
	end

	private
	def event_params
		params.require(:event).permit(:name, :place, :content, :start_time, :end_time)
	end
end