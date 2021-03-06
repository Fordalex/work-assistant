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
    # dict = {}
    # all_week_tickets(week_tickets).each do |ticket|
    #   if ticket.category.nil?
    #     next
    #   end
    #   category = ticket.category.name.to_s

    #   if dict.key?(category)
    #     dict[category][:count] += 1
    #     dict[category][:duration] += ticket.duration
    #   else
    #     dict[category] = { category: category, colour: ticket.category.colour, count: 1, duration: ticket.duration }
    #   end

    # end
    # dict.symbolize_keys
  end

  def values_for_chart(week_tickets, key)
    # all_categories_stats(week_tickets).map { |t| t[1][key] }.join(" ")
  end

  def total_duration(week_tickets)
    # if week_tickets.present?
    #   values_for_chart(week_tickets, :duration).split(" ").reduce{| a, v | a.to_i + v.to_i}
    # else
    #   0
    # end
  end

  def time_conversion(minutes)
    if minutes.nil?
      return "0h : 00m"
    end
    hours = minutes / 60
    rest = (minutes % 60).to_s
    rest = rest.length < 2 ? '0' + rest : rest
    "#{hours}h : #{rest}m"
  end

  def sort_feature_groups(feature_groups)
    # Gets a unique list of feature types
    feature_types = feature_groups.map{|fg| fg.feature.feature_type.name}.uniq

    # Sorts feature groups to a feature type
    feature_types.map do |key|
      key_feature_groups = feature_groups.filter{|fg| fg.feature.feature_type.name === key}
      values = key_feature_groups.map{|kfg| {name: kfg.feature.name, feature_ticket_type: kfg.feature.feature_ticket_type, text: kfg.text || ""} }
      {feature_type: key, features: values}
    end
  end
end
