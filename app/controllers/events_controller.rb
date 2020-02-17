class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(start_date: params['start_date'], duration: params[:duration], title: params['title'], description: params['description'], price: params['price'], location: params[:location], admin_id: current_user.id)
    if @event.save
      redirect_to "/"
      flash[:success] = "L'événement a bien été créé !"
    else
      render :new
      flash[:danger] = "L'énévement' n'a pas été créé !"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
