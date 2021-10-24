module TicketsHelper
  def all_week_tickets(week_tickets)
    tickets = []
    week_tickets.each do |day, dict|
      tickets += dict[:tickets]
    end
    tickets
  end

  def total_tickets(week_tickets)
    all_week_tickets(week_tickets).count
  end

  def all_categories_stats(week_tickets)
    dict = {}
    all_week_tickets(week_tickets).each do |ticket|
      category = ticket.category.name.to_s

      if dict.key?(category)
        dict[category][:count] += 1
        dict[category][:duration] += ticket.duration
      else
        dict[category] = { count: 1, duration: ticket.duration }
      end

    end
    dict.symbolize_keys
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    "#{hours}h #{rest}m"
  end
end
