class NotesController < TicketsController
  before_action :set_members, only: %i[notes]
  before_action :set_subjects, only: %i[notes]
  before_action :set_languages, only: %i[notes]
  before_action :set_categories, only: %i[notes]

  def notes
    @tickets = Ticket.where(user: current_user)
  end
end
