class NotesController < TicketsController
  before_action :set_members, only: %i[notes]
  before_action :set_subjects, only: %i[notes]
  before_action :set_languages, only: %i[notes]
  before_action :set_categories, only: %i[notes]

  # TODO refactor this controller
  # TODO Write some tests!!

  def notes
    @tickets = find_tickets
    @searched_categories = searched_key(:categories)
    @searched_members = searched_key(:members)
    @searched_subjects = searched_key(:subjects)
    @searched_languages = searched_key(:languages)
  end

  private

  def searched_key(key)
    if params[key].present?
      params[key][0].keys
    else
      []
    end
  end

  def find_tickets
    tickets = Ticket.where(user: current_user)
    filter_by_category(tickets)
  end

  def filter_by_category(tickets)
    if params[:categories].present?
      tickets = tickets.filter{|t| params[:categories][0].keys.include?(t.category.name)}
    end
    filter_by_subject(tickets)
  end

  def filter_by_subject(tickets)
    if params[:subjects].present?
      tickets = tickets.filter do |ticket|
        ticket_subjects = ticket.subject_groups.reduce([]) { |a,sg| a << sg.subject.name }
        searched_subjects = params[:subjects][0].keys
        searched_subjects.all? { |i| ticket_subjects.include?(i) }
      end
    else
      tickets
    end
    filter_by_member(tickets)
  end

  def filter_by_member(tickets)
    if params[:members].present?
      tickets = tickets.filter do |ticket|
        ticket_members = ticket.member_groups.reduce([]) { |a,sg| a << sg.member.name }
        searched_members = params[:members][0].keys
        searched_members.all? { |i| ticket_members.include?(i) }
      end
    else
      tickets
    end
    filter_by_technology(tickets)
  end

  def filter_by_technology(tickets)
    if params[:languages].present?
      tickets = tickets.filter do |ticket|
        ticket_languages = ticket.language_groups.reduce([]) { |a,sg| a << sg.language.name }
        searched_languages = params[:languages][0].keys

        searched_languages.all? { |i| ticket_languages.include?(i) }
      end
    else
      tickets
    end
  end
end
