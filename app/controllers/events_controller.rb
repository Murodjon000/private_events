class EventsController < ApplicationController
  before_action :logged_in, except: [ :index ] 

  def index
    @events = Event.all.order('date DESC')
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event '#{@event.name}' successfuly created."
      redirect_to @event
    else
      flash[:alert] = 'Error happened.'
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location, :user_id)
  end
end
