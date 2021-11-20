module CollectionHelper
  def web_developer_template(collection)
    technical = FeatureType.create!(
      collection: collection,
      name: "Technical"
    )
    Feature.create!(
      name: "Code",
      feature_type: technical
    )
    Feature.create!(
      name: "Resource",
      feature_type: technical
    )
    language = FeatureType.create!(
      collection: collection,
      name: "Languages"
    )
    Feature.create!(
      name: "HTML",
      feature_type: language
    )
    Feature.create!(
      name: "CSS",
      feature_type: language
    )
    Feature.create!(
      name: "JS",
      feature_type: language
    )
  end
end
