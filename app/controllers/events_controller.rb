class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def search
    #@q = Event.ransack(params[:q])
    #@searched_events = @q.result.includes(:eventtypes)
    @newest_events = Event.order(created_at: :DESC)
    @events = Event.all
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
                    marker.lat event.latitude
                    marker.lng event.longitude
                    marker.infowindow event.name
    end
  end

  def index
    @events = Event.order(params[:sort] + " " + params[:direction])
  end

  def new
    @event = current_user.events.build
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.name
    end
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to "/events?direction=desc&sort=start_date"
    else
      render action: "new"
    end
  end

  def show
  end

  def edit
    @event = Event.find(params[:id])
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.name
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Usunięto wydarzenie"
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :address,
      :city,
      :start_date,
      :end_date,
      :start_time,
      :end_time,
      :is_paid,
      :price,
      :eventtype_ids => []
  )

  end
end
