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
    )
    Feature.create!(
      name: "HTML",
      feature_type: language,
    )
    Feature.create!(
      name: "CSS",
      feature_type: language,
    )
    Feature.create!(
      name: "JS",
      feature_type: language,
    )
    FeatureType.create!(
      collection: collection,
      name: "Members",
    )
    job_type = FeatureType.create!(
      collection: collection,
      name: "Work type",
    )
    Feature.create!(
      name: "Pairing",
      feature_type: job_type,
    )
    Feature.create!(
      name: "Solo",
      feature_type: job_type,
    )
    Feature.create!(
      name: "Training",
      feature_type: job_type,
    )
    Feature.create!(
      name: "Meeting",
      feature_type: job_type,
    )
    Feature.create!(
      name: "Phone call",
      feature_type: job_type,
    )
  end
end
