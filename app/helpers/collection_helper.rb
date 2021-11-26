module CollectionHelper
  def web_developer_template(collection)
    technical = FeatureType.create!(
      collection: collection,
      name: "Technical",
      colour: "#ff9500"
    )
    resource = Feature.create!(
      name: "Resource",
      feature_type: technical,
      feature_ticket_type: "Link"
    )
    Feature.create!(
      name: "Trello Ticket",
      feature_type: technical,
      feature_ticket_type: "Link"
    )
    Feature.create!(
      name: "Bit Bucket",
      feature_type: technical,
      feature_ticket_type: "Link"
    )
    Feature.create!(
      name: "Branch Name",
      feature_type: technical,
      feature_ticket_type: "Link"
    )

    language = FeatureType.create!(
      collection: collection,
      name: "Languages",
      colour: "#ffdd00"
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
    Feature.create!(
      name: "TS",
      feature_type: language,
    )
    ruby = Feature.create!(
      name: "Ruby",
      feature_type: language,
    )

    members = FeatureType.create!(
      collection: collection,
      name: "Members",
      colour: "#87cc33"
    )
    Feature.create!(
      name: "Bob",
      feature_type: members,
    )
    Feature.create!(
      name: "Beth",
      feature_type: members,
    )

    job_type = FeatureType.create!(
      collection: collection,
      name: "Work type",
      colour: "#34dfc3"
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


    status = FeatureType.create!(
      collection: collection,
      name: "status",
      colour: "#316bc9"
    )
    Feature.create!(
      name: "WIP",
      feature_type: status,
    )
    Feature.create!(
      name: "Completed",
      feature_type: status,
    )

    programming = FeatureType.create!(
      collection: collection,
      name: "Programming",
      colour: "#9636c9"
    )
    Feature.create!(
      name: "Object",
      feature_type: programming,
      feature_ticket_type: "Text"
    )
    Feature.create!(
      name: "Class",
      feature_type: programming,
      feature_ticket_type: "Text"
    )
    Feature.create!(
      name: "Function",
      feature_type: programming,
      feature_ticket_type: "Text"
    )
    method = Feature.create!(
      name: "Method",
      feature_type: programming,
      feature_ticket_type: "Text"
    )

    ticket = Ticket.create(
      collection: collection,
      date: Date.today,
      title: "Welcome!",
      description: "Here you will see all the tickets you've created, you can filter from any attribute added to your tickets, these can be fully customised from the CMS page. To get the best from this application take short descriptive notes and tag the languages and link helpful resources to your tickets to retrieve information quickly. Also, use the filters provided to speed up your workflow.",
      duration: 60,
      start_time: Time.now + 1.hour
    )
    FeatureGroup.create(
      ticket: ticket,
      feature: method,
      text: "send"
    )
    FeatureGroup.create(
      ticket: ticket,
      feature: ruby
    )
    FeatureGroup.create(
      ticket: ticket,
      feature: resource
    )
  end
end
