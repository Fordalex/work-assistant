class NotesController < SessionsController
    def notes
      @tickets = Ticket.where(user: current_user)
    end
end
