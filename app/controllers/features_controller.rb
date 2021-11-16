class FeaturesController < ApplicationController
  def new
    @feature_types = FeatureType.where(user: current_user)
  end

  def create
    @feature = Feature.new(features_params.merge(user: current_user))
    if @feature.save!

    else

    end
    redirect_to cms_path
  end

  def edit
  end

  def update
    if @feature.update(features_params)

    else

    end
    redirect_to cms_path
  end

  private

  def features_params
    params.require(:feature).permit(:name, :colour, :content, :feature_type_id)
  end
end