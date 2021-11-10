class FeatureTypesController < ApplicationController
  before_action :set_featue_type, only: %i[edit update]

  def new
  end

  def create
    @feature_type = FeatureType.new(feature_types_params.merge(user: current_user))
    if @feature_type.save!

    else

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

  private

  def set_featue_type
    @feature_type = FeatureType.find(params[:id])
  end

  def feature_types_params
    params.require(:feature_type).permit(:name, :content, :colour)
  end
end
