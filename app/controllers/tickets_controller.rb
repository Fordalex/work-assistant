class TicketsController < ApplicationController
  def create
    ticket = Ticket.new(tickets_params.merge(user: current_user))
    if ticket.save!
      flash[:success] = "#{ticket.category.name} ticket has been added!"
    else
      flash[:warning] = "An error occured please try again"
    end

    redirect_to root_path
  end

  private

  def tickets_params
    params.require(:ticket).permit(:category_id, :description, :start_time, :date, :duration, :members, :subjects)
  end
end
