class HomeController < ApplicationController
    def home
      @week_tickets = {
        "#{Ticket.first.date.strftime("%A")}": Ticket.all.to_a,
        "Tuesday": [],
        "Wednesday": [],
        "Thursday": [],
        "Friday": [],
        "Saturday": [],
        "Sunday": []
      }
    end
end
