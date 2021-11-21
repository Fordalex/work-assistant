module CollectionHelper
  def web_developer_template(collection)
    technical = FeatureType.create!(
      collection: collection,
      name: "Technical"
    )
    Feature.create!(
      name: "Code",
      feature_type: technical,
      feature_ticket_type: "Text"
    )
    Feature.create!(
      name: "Resource",
      feature_type: technical,
      feature_ticket_type: "Text"
    )
    language = FeatureType.create!(
      collection: collection,
      name: "Languages",
      feature_ticket_type: "Select"
    )
    Feature.create!(
      name: "HTML",
      feature_type: language,
      feature_ticket_type: "Select"
    )
    Feature.create!(
      name: "CSS",
      feature_type: language,
      feature_ticket_type: "Select"
    )
    Feature.create!(
      name: "JS",
      feature_type: language,
      feature_ticket_type: "Select"
    )
  end
end
