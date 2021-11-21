class TicketsController < SessionsController
  before_action :set_ticket, only: %i[edit update destroy]
  before_action :set_feature_types, only: %i[edit new]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(tickets_params.merge(collection: @collection))
    if @ticket.save
      update_features
      flash[:success] = "#{@ticket.title} ticket has been added!"
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
      update_features
      flash[:success] = "#{@ticket.title} ticket has been updated!"
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
    @ticket = Ticket.where(collection: @collection, id: params[:id]).first
  end

  def tickets_params
    params.require(:ticket).permit(:title, :description,
      :start_time, :date, :duration, :feature_checkboxes)
  end

  def set_feature_types
    @feature_types = FeatureType.where(collection: @collection)
  end

  def feature_checkboxes_params
    params[:ticket][:feature_checkboxes]
  end

  def feature_text_params
    params[:ticket][:feature_text]
  end

  def update_features
    FeatureGroup.where(ticket: @ticket).destroy_all
    if feature_checkboxes_params
      update_feature_checkboxes
    end

    if feature_text_params
      update_feature_text
    end
  end

  def update_feature_checkboxes
    params[:ticket][:feature_checkboxes].each do |feature_id, active|
      if active == "1"
        feature = Feature.find_by(id: feature_id)
        FeatureGroup.create!(
          feature: feature,
          ticket: @ticket
        )
      end
    end
  end

  def update_feature_text
    feature_text_params.each do |feature_id, text|
      if text.present?
        feature = Feature.find_by(id: feature_id)
        FeatureGroup.create!(
          feature: feature,
          ticket: @ticket,
          text: text,
        )
      end
    end
  end
end
