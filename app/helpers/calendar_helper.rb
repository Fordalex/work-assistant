module CalendarHelper
  def ticket_position(ticket)
    top = (ticket&.start_time&.strftime("%H").to_i * 60)
    top += ticket&.start_time&.strftime("%M").to_i
  end
end
