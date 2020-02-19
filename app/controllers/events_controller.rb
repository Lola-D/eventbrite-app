class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params['id'])
    @attedance = Attendance.new
    @attendances = @event.attendances
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.admin = current_user
    if @event.save
      redirect_to "/"
      flash[:success] = "L'événement a bien été créé !"
    else
      render :new
      flash[:danger] = "L'énévement n'a pas été créé !"
    end
  end

  def edit
    @event = Event.find(params['id'])
  end

  def update
    @event = Event.find(params['id'])
    if @event.update(event_params)
      redirect_to event_path(@event.id)
      flash[:success] = "L'événement a bien été édité !"
    else
      redirect_to edit_event_path(@event.id)
      flash[:danger] = "L'événement n'a pas été édité !"
    end
  end

  def destroy
    @user = current_user
    @event = Event.find(params['id'])
    if @event.destroy
      redirect_to user_path(@user.id)
      flash[:success] = "L'événement a bien été supprimé !"
    else
      render event_path(@event.id)
      flash[:danger] = "L'événement n'a pas été supprimé !"
    end
  end


  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end

end
