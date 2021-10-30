class HomeController < TicketsController
  before_action :set_members, only: %i[home]
  before_action :set_subjects, only: %i[home]
  before_action :set_languages, only: %i[home]

  def home
    @start_date = start_date
    session[:start_date] = @start_date

    @week_tickets = {}
    7.times do |index|
      search_date = @start_date + index.days
      day_tickets = Ticket.where(user: current_user, date: search_date)
      @week_tickets["#{search_date.strftime("%A")}"] = {date: search_date, tickets: day_tickets}
    end

    @ticket = Ticket.new
  end

  private

  def start_date
    if params[:start_date]
      Date.parse(params[:start_date])
    elsif session[:start_date].present?
      Date.parse(session[:start_date])
    else
      Date.today
    end
  end
end
