class FeatureTypesController < SessionsController
  before_action :set_featue_type, only: %i[edit update destroy]

  def new
    @feature_type = FeatureType.new
  end

  def create
    @feature_type = FeatureType.new(feature_types_params.merge(collection: @collection))
    if @feature_type.save!
      flash[:success] = "#{@feature_type.name} created successfully"
    else
      render 'new'
      flash[:success] = "An error occurred please try again."
    end
    redirect_to cms_path
  end

  def edit
  end

  def update
    if @feature_type.update(feature_types_params)

    else

    end
    redirect_to cms_path
  end

  def destroy
    @feature_type.destroy
    flash[:success] = "Feature types has been removed."
    redirect_to cms_path
  end

  private

  def set_featue_type
    @feature_type = FeatureType.find(params[:id])
  end

  def feature_types_params
    params.require(:feature_type).permit(:name, :colour)
  end
end
