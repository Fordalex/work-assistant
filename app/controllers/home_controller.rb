class HomeController < SessionsController
    def home
      @start_date = date_params ? Date.parse(date_params) : Date.today

      @week_tickets = {}

      7.times do |index|
        search_date = @start_date + index.days
        day_tickets = Ticket.where(user: current_user, date: search_date)
        @week_tickets["#{search_date.strftime("%A")}"] = day_tickets
      end
    end

    private

    def date_params
      params[:start_date]
    end
end
