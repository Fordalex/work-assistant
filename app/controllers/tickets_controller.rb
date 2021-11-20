class TicketsController < SessionsController
  before_action :set_ticket, only: %i[edit update destroy]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(tickets_params.merge(user: current_user))
    if @ticket.save
      flash[:success] = "#{@ticket.category.name} ticket has been added!"
      redirect_to notes_path
    else
      flash[:warning] = "An error occured please try again"
      render "new"
    end
  end

  def edit
  end

  def update
    if @ticket.update(tickets_params)
      flash[:success] = "#{@ticket.category.name} ticket has been updated!"
      redirect_to notes_path
    else
      flash[:warning] = "An error occured please try again"
      render "edit"
    end
  end

  def destroy
    @ticket.destroy
    redirect_to notes_path
  end

  private

  def set_ticket
    @ticket = Ticket.where(user: current_user, id: params[:id]).first
  end

  def tickets_params
    params.require(:ticket).permit(:category_id, :description,
      :start_time, :commit, :resource, :date, :duration, :technical)
  end
end
