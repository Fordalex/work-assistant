class TicketsController < SessionsController
  before_action :set_ticket, only: %i[edit update destroy]
  before_action :set_subjects, only: %i[edit update new create]
  before_action :set_members, only: %i[edit update new create]
  before_action :set_categories, only: %i[edit update new create]
  before_action :set_languages, only: %i[edit update new create]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(tickets_params.merge(user: current_user))
    if @ticket.save
      update_members(@ticket) if params[:ticket][:member_checkboxes]
      update_subjects(@ticket) if params[:ticket][:subject_checkboxes]
      update_languages(@ticket) if params[:ticket][:language_checkboxes]
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
      update_members(@ticket) if params[:ticket][:member_checkboxes]
      update_subjects(@ticket) if params[:ticket][:subject_checkboxes]
      update_languages(@ticket) if params[:ticket][:language_checkboxes]
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

  def set_subjects
    @subjects = Subject.where(user: current_user)
  end

  def set_members
    @members = Member.where(user: current_user)
  end

  def set_languages
    @languages = Language.where(user: current_user)
  end

  def set_categories
    @categories = Category.where(user: current_user)
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

  def update_languages(ticket)
    language_groups = LanguageGroup.where(ticket: ticket)
    language_groups.destroy_all
    params[:ticket][:language_checkboxes].each do |language_id, active|
      if active == "1"
        language = Language.find(language_id)
        LanguageGroup.create(
          language: language,
          ticket: ticket
        )
      end
    end
  end

  def tickets_params
    params.require(:ticket).permit(:category_id, :description,
      :start_time, :commit, :resource, :date, :duration, :technical)
  end
end
