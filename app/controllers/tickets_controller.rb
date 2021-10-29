class TicketsController < SessionsController
  before_action :set_ticket, only: %i[edit update destroy]
  before_action :set_subjects, only: %i[edit update]
  before_action :set_members, only: %i[edit update]

  def create
    ticket = Ticket.new(tickets_params.merge(user: current_user))
    if ticket.save!
      flash[:success] = "#{ticket.category.name} ticket has been added!"
    else
      flash[:warning] = "An error occured please try again"
    end

    redirect_to root_path
  end

  def edit
  end

  def update
    if @ticket.update(tickets_params)
      flash[:success] = "#{@ticket.category.name} ticket has been updated!"
      redirect_to root_path
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

  def set_subjects
    @subjects = Subject.where(user: current_user)
  end

  def set_members
    @members = Member.where(user: current_user)
  end

  def tickets_params
    params.require(:ticket).permit(:category_id, :description, :start_time, :date, :duration, :members, :subjects)
  end
end
