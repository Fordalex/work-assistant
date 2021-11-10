class FeatureTypesController < ApplicationController
  def create
    @feature_type = FeatureType.new(feature_types_params.merge(user: current_user))
    if @feature_type.save!

    else

    end
    redirect_to cms_path
  end

  private

  def feature_types_params
    params.require(:feature_type).permit(:name, :content, :colour)
  end
end
