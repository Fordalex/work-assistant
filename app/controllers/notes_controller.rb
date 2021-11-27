class NotesController < TicketsController
  before_action :get_tickets, only: %i[notes]

  def notes
    @feature_types = FeatureType.where(collection: @collection)
    @feature_ids = feature_ids
  end

  private

  def feature_ids
    ids = []
    if params[:feature_types].present?
      params[:feature_types].each do |key, value|
        value.each.map{|k,v| ids << k.to_i}
      end
    end
    ids
  end

  def get_tickets
    if feature_ids.any?
      @tickets = Ticket.joins(:feature_groups).where(collection: @collection, feature_groups: { feature: feature_ids }).uniq
    else
      @tickets = Ticket.joins(:feature_groups).where(collection: @collection).uniq
    end
  end
end
