class EventimagesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event.eventimage.attach(params[:eventimage])
    redirect_to(event_path(@event.id))
  end
  
end
