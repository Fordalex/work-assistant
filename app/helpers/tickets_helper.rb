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

  def all_categories_with_count(week_tickets)
    dict = {}
    all_week_tickets(week_tickets).each do |ticket|
      category = ticket.category.name.to_s
      dict[category] = dict.key?(category) ? (dict[category] + 1) : 1
    end
    dict.symbolize_keys
  end
end
