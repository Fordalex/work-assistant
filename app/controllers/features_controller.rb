class FeaturesController < SessionsController
  before_action :set_feature, only: %i[edit update destroy]
  before_action :set_feature_types, only: %i[edit new]

  def new
  end

  def create
    @feature = Feature.new(features_params)
    if @feature.save!
      flash[:success] = "#{@feature.name} feature has been added!"
    else

    end
    redirect_to cms_path
  end

  def edit
  end

  def update
    if @feature.update(features_params)
      flash[:success] = "#{@feature.name} feature has been updated!"
    else

    end
    redirect_to cms_path
  end

  def destroy
    @feature.destroy
    redirect_to cms_path
  end

  private

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def set_feature_types
    @feature_types = FeatureType.where(collection: @collection)
  end

  def features_params
    params.require(:feature).permit(:name, :colour, :content, :feature_type_id, :feature_ticket_type)
  end
end
