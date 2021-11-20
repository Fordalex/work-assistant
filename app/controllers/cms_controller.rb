class CmsController < TicketsController
  def cms
    @feature_types = FeatureType.where(collection: @collection)
  end
end
