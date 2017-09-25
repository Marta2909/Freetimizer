module EventsHelper
  def sortable(column, title)
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def checked(area)
    @event.eventtype_ids.nil? ? false : @event.eventtype_ids.match(area)
  end

end
