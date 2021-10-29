class TicketsController < SessionsController
  before_action :set_ticket, only: %i[edit update destroy]
  before_action :set_subjects, only: %i[edit update new]
  before_action :set_members, only: %i[edit update new]

  def new
    @ticket = Ticket.new
  end

  def create
    ticket = Ticket.new(tickets_params.merge(user: current_user))
    if ticket.save!
      update_members(ticket)
      flash[:success] = "#{ticket.category.name} ticket has been added!"
    else
      flash[:warning] = "An error occured please try again"
      render "edit"
    end
    redirect_to root_path
  end

  def edit
  end

  def update
    if @ticket.update(tickets_params)
      update_members(@ticket)
      update_subjects(@ticket)
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

  def update_members(ticket)
    member_groups = MemberGroup.where(ticket: ticket)
    member_groups.destroy_all
    params[:ticket][:member_checkboxes].each do |member_id, active|
      if active == "1"
        member = Member.find(member_id)
        MemberGroup.create(
          member: member,
          ticket: ticket
        )
      end
    end
  end

  def update_subjects(ticket)
    subject_groups = SubjectGroup.where(ticket: ticket)
    subject_groups.destroy_all
    params[:ticket][:subject_checkboxes].each do |subject_id, active|
      if active == "1"
        subject = Subject.find(subject_id)
        SubjectGroup.create(
          subject: subject,
          ticket: ticket
        )
      end
    end
  end

  def tickets_params
    params.require(:ticket).permit(:category_id, :description, :start_time, :commit, :resource, :date, :duration, :member_checkboxes, :subject_checkboxes)
  end
end
