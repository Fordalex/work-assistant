class CmsController < TicketsController
  def cms
    @feature_types = FeatureType.where(user: current_user)
  end
end
