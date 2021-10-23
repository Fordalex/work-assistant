class HomeController < SessionsController
    def home
      @start_date = date_params ? Date.parse(date_params) : Date.today

      @week_tickets = {}

      7.times do |index|
        search_date = @start_date + index.days
        day_tickets = Ticket.where(user: current_user, date: search_date)
        if day_tickets.any?
          @week_tickets["#{day_tickets.first&.date&.strftime("%A")}"] = day_tickets
        else
          @week_tickets["#{search_date.strftime("%A")}"] = []
        end
      end
    end

    private

    def date_params
      params[:start_date]
    end
end
